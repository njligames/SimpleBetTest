import 'package:flutter/material.dart';
import 'model.dart';
import 'view.dart';
import 'MLBUtil.dart';
import 'ScheduledGameView.dart';

class ScheduledGames extends StatefulWidget {
  DateTime dateTime;
  List<Team> teams;

  ScheduledGames({this.teams, this.dateTime});

  @override
  ScheduledGamesState createState() => ScheduledGamesState(teams: this.teams, dateTime: this.dateTime);
}

class ScheduledGamesState extends State<ScheduledGames> {
  DateTime dateTime;
  List<Team> teams;
  Map<int, Team> teamMap;

  static Size screenSize;

  ScheduledGamesState({this.teams, this.dateTime});

  Future<Games> games;

  List<GameView> gameViews;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  static Widget gameViewWidget(Image homeImage, String homeName, String homeScore,
      Image awayImage, String awayName, String awayScore) {

    Widget row = Row( children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,

        child: Column( children: <Widget>[
          homeImage,
          Text(homeName, textAlign: TextAlign.center,),
        ],),
      ),
      Text(" "),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(homeScore.toString(), textAlign: TextAlign.right,),
      ),

      Expanded( child: Text("Final", textAlign: TextAlign.center,),),

      Align(
        alignment: Alignment.centerRight,
        child: Text(awayScore),
      ),

      Text(" "),
      Align(
        alignment: Alignment.centerRight,
        child: Column(children: <Widget>[
          awayImage,
          Text(awayName, textAlign: TextAlign.center),
        ],),
      ),

    ],
    );

    return Column(children: <Widget>[Container(height: 90, width: screenSize.width, margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), child: row,)],);
  }

  Widget _buildGameScoreCard(GameView gameView) {

    var child = Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFF000000)),
            left: BorderSide(width: 1.0, color: Color(0xFF000000)),
            right: BorderSide(width: 1.0, color: Color(0xFF000000)),
            bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
          ),
        ),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: gameViewWidget(
          gameView.home.getImage(),
          gameView.home.team.abbreviation,
          gameView.home.teamScore.toString(),

          gameView.away.getImage(),
          gameView.away.team.abbreviation,
          gameView.away.teamScore.toString())
    );

    return Center(child: child,);
  }

  Widget _buildGameList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if(i < gameViews.length) {
            return _buildRow(gameViews[i]);
          }
        });
  }

  Widget _buildRow(GameView gameView) {


    return ListTile(
      title: _buildGameScoreCard(gameView),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScheduledGameView(gameView: gameView,)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    teamMap = TeamView.buildTeamsMap(this.teams);

    games = MLBUtil.fetchScheduleForDateTime(this.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text("TODAY'S GAMES"),
      ),
      body: FutureBuilder<Games>(
        future: games,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            Games g = snapshot.data;

            List<Game> glst = new List<Game>();
            for(int i = 0; i < g.dates.length; i++) {
              for(int j = 0; j < g.dates[i].games.length; j++) {
                glst.add(g.dates[i].games[j]);
              }
            }

            gameViews = new List<GameView>();
            for(int i = 0; i < glst.length; i++) {

              Team homeTeam = teamMap[glst[i].teams.home.team.id];
              Team awayTeam = teamMap[glst[i].teams.away.team.id];

              TeamView home = new TeamView(team: homeTeam);
              home.teamScore = glst[i].teams.home.score;

              TeamView away = new TeamView(team: awayTeam);
              away.teamScore = glst[i].teams.away.score;

              gameViews.add(new GameView(gameId: glst[i].gamePk, home: home, away: away));
            }
            return _buildGameList();

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}