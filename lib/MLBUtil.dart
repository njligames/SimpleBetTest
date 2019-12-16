import 'model.dart';
import 'view.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http/http.dart' show get;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class MLBUtil {

  static Future<Games> fetchScheduleForDateTime(DateTime date) async {
    var month = date.month;
    var day = date.day;
    var year = date.year;
    String dateString = month.toString() + "/" + day.toString() + "/" + year.toString();

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/schedule/?sportId=1&date='+dateString);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Games.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<LiveData> fetchLiveDataForGameId(int gameID) async {

    //https://statsapi.mlb.com/api/v1.1/game/534196/feed/live?fields=liveData,linescore,teams,away,home,runs

    final response =
    await http.get('https://statsapi.mlb.com/api/v1.1/game/' + gameID.toString() + '/feed/live?fields=liveData,linescore,teams,away,home,runs');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return LiveData.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<Games> fetchLinescoreForGameId(int gameID) async {

//  https://statsapi.mlb.com/api/v1/game/531060/linescore

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/game/' + gameID.toString() + '/linescore');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var g = Games.fromJson(json.decode(response.body));

      return g;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<LiveData> fetchBattersPitchersForGameId(int gameID) async {

//  https://statsapi.mlb.com/api/v1.1/game/534196/feed/live?fields=liveData,boxscore,teams,id,batters,pitchers,battingOrder

    final response =
    await http.get('https://statsapi.mlb.com/api/v1.1/game/' + gameID.toString() + '/feed/live?fields=liveData,boxscore,teams,id,batters,pitchers,battingOrder');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var ld = LiveData.fromJson(json.decode(response.body));
      print(ld);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<Boxscore> fetchPlayerGameStatsForGameId(int gameID) async {

//  https://statsapi.mlb.com/api/v1/game/599342/boxscore?fields=teams,record,wins,losses,players,fullName,position,name,type,abbreviation,stats,batting,doubles,triples,homeRuns,strikeOuts,fielding,assists,errors,putOuts,pitching,runs,atBats,hits,rbi,inningsPitched,strikeOuts,strikes,avg,obp,balls,baseOnBalls,pitchCount

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/game/' + gameID.toString() + '/boxscore?fields=teams,record,wins,losses,players,fullName,position,name,type,abbreviation,stats,batting,doubles,triples,homeRuns,strikeOuts,fielding,assists,errors,putOuts,pitching,runs,atBats,hits,rbi,inningsPitched,strikeOuts,strikes,avg,obp,balls,baseOnBalls,pitchCount');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var bs = Boxscore.fromJson(json.decode(response.body));

      return bs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


  static Future<Person> fetchPerson(int personId) async {

//  https://statsapi.mlb.com/api/v1/people/623457

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/people/' + personId.toString());

    if (response.statusCode == 200) {
      Games games = Games.fromJson(json.decode(response.body));
      List<Person> people = games.people;
      Person person = null;
      for(var i = 0; null == person && i < people.length; i++) {
        if(people[i].id == personId) {
          person = people[i];
        }
      }
      // If the call to the server was successful, parse the JSON.
      return person;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<Team> fetchTeam(int teamId) async {

//  https://statsapi.mlb.com/api/v1/people/623457

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/teams/' + teamId.toString());

    if (response.statusCode == 200) {
      Games games = Games.fromJson(json.decode(response.body));
      List<Team> teams = games.teamList;
      Team team = null;
      for(var i = 0; null == team && i < teams.length; i++) {
        if(teams[i].id == teamId) {
          team = teams[i];
        }
      }
      // If the call to the server was successful, parse the JSON.
      return team;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Team>> fetchTeams() async {

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/teams/');

    if (response.statusCode == 200) {
      Games games = Games.fromJson(json.decode(response.body));
      List<Team> teams = games.teamList;

      // If the call to the server was successful, parse the JSON.
      return teams;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<Venue> fetchVenue(int venueId) async {

//  https://statsapi.mlb.com/api/v1/people/623457

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/venues/' + venueId.toString());

    if (response.statusCode == 200) {
      Games games = Games.fromJson(json.decode(response.body));
      List<Venue> venues = games.venues;
      Venue venue = null;
      for(var i = 0; null == venue && i < venues.length; i++) {
        if(venues[i].id == venueId) {
          venue = venues[i];
        }
      }
      // If the call to the server was successful, parse the JSON.
      return venue;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Venue>> fetchVenues() async {

    final response =
    await http.get('https://statsapi.mlb.com/api/v1/venues/');

    if (response.statusCode == 200) {
      Games games = Games.fromJson(json.decode(response.body));
      List<Venue> venues = games.venues;

      // If the call to the server was successful, parse the JSON.
      return venues;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<File> fetchImage(String imgUrl, String imgName) async {
    var response = await get(imgUrl);
    var documentDirectory = await getApplicationDocumentsDirectory();

    File file = new File(
        join(documentDirectory.path, imgName)
    );

    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }

  static Future<MLBGameIdData> fetchGameData(int gameID) async {
    final fetchLiveDataForGameIdResponse =
    await http.get('https://statsapi.mlb.com/api/v1.1/game/' + gameID.toString() + '/feed/live?fields=liveData,linescore,teams,away,home,runs');

    if (fetchLiveDataForGameIdResponse.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      LiveData liveData = LiveData.fromJson(json.decode(fetchLiveDataForGameIdResponse.body));

      final fetchLinescoreForGameIdResponse =
      await http.get('https://statsapi.mlb.com/api/v1/game/' + gameID.toString() + '/linescore');

      if (fetchLinescoreForGameIdResponse.statusCode == 200) {
        // If the call to the server was successful, parse the JSON.
        Games linescore = Games.fromJson(json.decode(fetchLinescoreForGameIdResponse.body));

        final fetchBattersPitchersForGameIdResponse =
        await http.get('https://statsapi.mlb.com/api/v1.1/game/' + gameID.toString() + '/feed/live?fields=liveData,boxscore,teams,id,batters,pitchers,battingOrder');

        if (fetchBattersPitchersForGameIdResponse.statusCode == 200) {
          // If the call to the server was successful, parse the JSON.
          LiveData battersPitchers = LiveData.fromJson(json.decode(fetchBattersPitchersForGameIdResponse.body));

          final fetchPlayerGameStatsForGameIdResponse =
          await http.get('https://statsapi.mlb.com/api/v1/game/' + gameID.toString() + '/boxscore?fields=teams,record,wins,losses,players,fullName,position,name,type,abbreviation,stats,batting,doubles,triples,homeRuns,strikeOuts,fielding,assists,errors,putOuts,pitching,runs,atBats,hits,rbi,inningsPitched,strikeOuts,strikes,avg,obp,balls,baseOnBalls,pitchCount');

          if (fetchPlayerGameStatsForGameIdResponse.statusCode == 200) {
            // If the call to the server was successful, parse the JSON.
            Boxscore playerGameStats = Boxscore.fromJson(json.decode(fetchPlayerGameStatsForGameIdResponse.body));

            return new MLBGameIdData(liveData: liveData, linescore: linescore, battersPitchers: battersPitchers, playerGameStats: playerGameStats);

          } else {
            // If that call was not successful, throw an error.
            throw Exception('Failed to load post');
          }

        } else {
          // If that call was not successful, throw an error.
          throw Exception('Failed to load post');
        }

      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }


    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class MLBGameIdData{
  LiveData liveData;
  Games linescore;
  LiveData battersPitchers;
  Boxscore playerGameStats;

  MLBGameIdData({this.liveData, this.linescore, this.battersPitchers, this.playerGameStats});
}