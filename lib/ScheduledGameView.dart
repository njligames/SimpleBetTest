
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'view.dart';
import 'MLBUtil.dart';
import 'LinescoreWidget.dart';
import 'ScheduledGames.dart';
import 'HittersViewWidget.dart';
import 'PitchersViewWidget.dart';


class ScheduledGameView extends StatefulWidget {
  GameView gameView;

  ScheduledGameView({this.gameView});

  @override
  ScheduledGameViewState createState() => ScheduledGameViewState(gameView: this.gameView);
}

class ScheduledGameViewState extends State<ScheduledGameView> {
  GameView gameView;

  ScheduledGameViewState({this.gameView});

  Future<MLBGameIdData> _MLBGameIdDataFuture;

  BattersView battersViewHome;
  BattersView battersViewAway;

  PitchersView pitchersViewHome;
  PitchersView pitchersViewAway;

  int scoreHome;
  int scoreAway;

  String nameAbbreviationHome;
  String nameAbbreviationAway;

  int numInnings;
  InningsView inningsViewHome;
  InningsView inningsViewAway;

  Map<int, Widget> logoWidgets;
  Map<int, Widget> stats;

  int sharedValue = 0;

  Text appBarTitleText = new Text("");

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(i);
        });
  }

  Widget _buildRow(int index) {
    if(0 == index) {
      return ListTile(
        title: Center(child: ScheduledGamesState.gameViewWidget(
            gameView.home.getImage(),
            gameView.home.team.abbreviation,
            gameView.home.teamScore.toString(),

            gameView.away.getImage(),
            gameView.away.team.abbreviation,
            gameView.away.teamScore.toString()),
        ),) ;
    } else if(1 == index) {
      String homeTeamName = this.nameAbbreviationHome;
      String awayTeamName = this.nameAbbreviationAway;

      List<int> homeTeamScores = this.inningsViewHome.getRunList();
      int homeTeamRuns = this.inningsViewHome.getRuns();
      int homeTeamHits = this.inningsViewHome.getHits();
      int homeTeamErrors = this.inningsViewHome.getErrors();

      List<int> awayTeamScores = this.inningsViewAway.getRunList();
      int awayTeamRuns = this.inningsViewAway.getRuns();
      int awayTeamHits = this.inningsViewAway.getHits();
      int awayTeamErrors = this.inningsViewAway.getErrors();

      return ListTile(
        title: LinescoreWidget(
            homeTeamName,
            awayTeamName,
            homeTeamScores,
            homeTeamRuns,
            homeTeamHits,
            homeTeamErrors,
            awayTeamScores,
            awayTeamRuns,
            awayTeamHits,
            awayTeamErrors,
            this.numInnings),
      );
    } else if(2 == index) {
      return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if(0 == i) {
              return CupertinoSegmentedControl<int>(

                children: logoWidgets,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              );
            } else if(1 == i) {
              return stats[sharedValue];
            }
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _MLBGameIdDataFuture = MLBUtil.fetchGameData(gameView.gameId);

    return Scaffold(
      appBar: AppBar(
        title: appBarTitleText,
      ),
      body: FutureBuilder<MLBGameIdData>(
        future: _MLBGameIdDataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            Boxscore bs = snapshot.data.playerGameStats;

            this.battersViewHome = new BattersView(batters: BattingView.populateBattingList(bs.teams.home.batters));
            this.battersViewAway = new BattersView(batters: BattingView.populateBattingList(bs.teams.away.batters));

            this.pitchersViewHome = new PitchersView(pitchers: PitchingView.populatePitchingList(bs.teams.home.pitchers));
            this.pitchersViewAway = new PitchersView(pitchers: PitchingView.populatePitchingList(bs.teams.away.pitchers));

            this.scoreHome = snapshot.data.liveData.linescore.teams.home.runs;
            this.scoreAway = snapshot.data.liveData.linescore.teams.away.runs;

            this.nameAbbreviationHome = bs.teams.home.team.abbreviation;
            this.nameAbbreviationAway = bs.teams.away.team.abbreviation;

            this.inningsViewHome = new InningsView(innings: new List<InningView>());
            this.inningsViewAway = new InningsView(innings: new List<InningView>());

            this.numInnings = snapshot.data.linescore.innings.length;

            this.logoWidgets =  <int, Widget>{
              0: Text(this.nameAbbreviationHome),
              1: Text(this.nameAbbreviationAway),
            };

            this.stats = <int, Widget>{
              0: Container(child: Column(
                children: <Widget>[
                  Text(" "),
                  Align(alignment: Alignment.bottomLeft, child: Text("Hitting", textAlign: TextAlign.left, style: _biggerFont, ),),
                  HittersViewWidget(this.battersViewHome),
                  Align(alignment: Alignment.bottomLeft, child: Text("Pitching", textAlign: TextAlign.left, style: _biggerFont,),),
                  PitchersViewWidget(this.pitchersViewHome),
                ],
              )),
              1: Container(child: Column(
                children: <Widget>[
                  Text(" "),
                  Align(alignment: Alignment.bottomLeft, child: Text("Hitting", textAlign: TextAlign.left, style: _biggerFont,),),
                  HittersViewWidget(this.battersViewAway),
                  Align(alignment: Alignment.bottomLeft, child: Text("Pitching", textAlign: TextAlign.left, style: _biggerFont,),),
                  PitchersViewWidget(this.pitchersViewAway),
                ],
              )),
            };

            for(int i = 0; i < snapshot.data.linescore.innings.length; i++) {
              InningView ivh = new InningView();
              ivh.num = snapshot.data.linescore.innings[i].num;
              ivh.runs = snapshot.data.linescore.innings[i].home.runs;
              ivh.hits = snapshot.data.linescore.innings[i].home.hits;
              ivh.errors = snapshot.data.linescore.innings[i].home.errors;

              InningView iva = new InningView();
              iva.num = snapshot.data.linescore.innings[i].num;
              iva.runs = snapshot.data.linescore.innings[i].away.runs;
              iva.hits = snapshot.data.linescore.innings[i].away.hits;
              iva.errors = snapshot.data.linescore.innings[i].away.errors;

              this.inningsViewHome.addInningView(ivh);
              this.inningsViewAway.addInningView(iva);
            }

            this.appBarTitleText = Text(nameAbbreviationHome + " @ " + nameAbbreviationAway);

            return _buildSuggestions();

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