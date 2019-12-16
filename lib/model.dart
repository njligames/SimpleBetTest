class Games {
  String copyright;
  int totalItems;
  int totalEvents;
  int totalGames;
  int totalGamesInProgress;
  List<Date> dates;
  LiveData liveData;
  int currentInning;
  String currentInningOrdinal;
  String inningState;
  String inningHalf;
  bool isTopInning;
  int scheduledInnings;
  List<Inning> innings;
  GamesTeams teams;
  Defense defense;
  Offense offense;
  int balls;
  int strikes;
  int outs;
  List<Person> people;
  List<Team> teamList;
  List<Venue> venues;

  Games({
    this.copyright,
    this.totalItems,
    this.totalEvents,
    this.totalGames,
    this.totalGamesInProgress,
    this.dates,
    this.liveData,
    this.currentInning,
    this.currentInningOrdinal,
    this.inningState,
    this.inningHalf,
    this.isTopInning,
    this.scheduledInnings,
    this.innings,
    this.teams,
    this.defense,
    this.offense,
    this.balls,
    this.strikes,
    this.outs,
    this.people,
    this.teamList,
    this.venues,
  });

  factory Games.fromJson(Map<String, dynamic> json) {

    List<dynamic> datesFromJson = json['dates'];
    List<Date> dates = new List<Date>();
    for(var i = 0; datesFromJson != null && i < datesFromJson.length; i++) {
      dates.add(Date.fromJson(datesFromJson[i]));
    }

    List<dynamic> inningsFromJson = json['innings'];
    List<Inning> innings = new List<Inning>();
    for(var i = 0; inningsFromJson != null && i < inningsFromJson.length; i++) {
      innings.add(Inning.fromJson(inningsFromJson[i]));
    }

    var liveData = new LiveData();
    if(json.containsKey('livedata')) {
      liveData = LiveData.fromJson(json['liveData']);
    }

    List<dynamic> peopleFromJson = json['people'];
    List<Person> people = new List<Person>();
    for(var i = 0; peopleFromJson != null && i < peopleFromJson.length; i++) {
      people.add(Person.fromJson(peopleFromJson[i]));
    }

    List<dynamic> venuesFromJson = json['venues'];
    List<Venue> venues = new List<Venue>();
    for(var i = 0; venuesFromJson != null && i < venuesFromJson.length; i++) {
      venues.add(Venue.fromJson(venuesFromJson[i]));
    }





    List<Team> teamList = null;
    GamesTeams teams = null;
    if(json.containsKey('teams')) {
      dynamic teams = json['teams'];
      String type = teams.runtimeType.toString();

      if(type == "List<dynamic>") {
        List<dynamic> teamsFromJson = json['teams'];
        teamList = new List<Team>();
        for(var i = 0; teamsFromJson != null && i < teamsFromJson.length; i++) {
          teamList.add(Team.fromJson(teamsFromJson[i]));
        }
      } else if(type == "Map<String, dynamic>") {
        teams = GamesTeams.fromJson(json['teams']);
      }
    }

    return Games(
      copyright : json['copyright'],
      totalItems : json['totalItems'],
      totalEvents : json['totalEvents'],
      totalGames : json['totalGames'],
      totalGamesInProgress : json['totalGamesInProgress'],
      dates : dates,                                    //List of Date
      liveData : liveData,                              //LiveData
      currentInning : json['currentInning'],
      currentInningOrdinal : json['currentInningOrdinal'],
      inningState : json['inningState'],
      inningHalf : json['inningHalf'],
      isTopInning : json['isTopInning'],
      scheduledInnings : json['scheduledInnings'],
      innings : innings,                                //List of Inning
      teams : teams,                                    //GamesTeams
      defense : Defense.fromJson(json['defense']),                                //Defense
      offense : Offense.fromJson(json['offense']),                                //Offense
      balls : json['balls'],
      strikes : json['strikes'],
      outs : json['outs'],
      people : people,
      teamList : teamList,
      venues : venues,
    );
  }
}

class Date {
  DateTime date;
  int totalItems;
  int totalEvents;
  int totalGames;
  int totalGamesInProgress;
  List<Game> games;
  List<dynamic> events;

  Date({
    this.date,
    this.totalItems,
    this.totalEvents,
    this.totalGames,
    this.totalGamesInProgress,
    this.games,
    this.events,
  });

  factory Date.fromJson(Map<String, dynamic> json) {

    List<dynamic> gamesFromJson = json['games'];

    List<Game> games = new List<Game>();
    for(var i = 0; i < gamesFromJson.length; i++) {
      games.add(Game.fromJson(gamesFromJson[i]));
    }

    var date = DateTime.parse(json['date']);
    return Date(
      date: date,
      totalItems: json['totalItems'],
      totalEvents: json['totalEvents'],
      totalGames: json['totalGames'],
      totalGamesInProgress: json['totalGamesInProgress'],
      games: games,
//      events: eventsList,
    );
  }
}

class Game {
  int gamePk;
  String link;
  String gameType;
  String season;
  DateTime gameDate;
  Status status;
  TeamRecords teams;
  Venue venue;
  Content content;
  bool isTie;
  int gameNumber;
  bool publicFacing;
  String doubleHeader;
  String gamedayType;
  String tiebreaker;
  String calendarEventId;
  String seasonDisplay;
  String dayNight;
  int scheduledInnings;
  int inningBreakLength;
  int gamesInSeries;
  int seriesGameNumber;
  String seriesDescription;
  String recordSource;
  String ifNecessary;
  String ifNecessaryDescription;

  Game({
    this.gamePk,
    this.link,
    this.gameType,
    this.season,
    this.gameDate,
    this.status,
    this.teams,
    this.venue,
    this.content,
    this.isTie,
    this.gameNumber,
    this.publicFacing,
    this.doubleHeader,
    this.gamedayType,
    this.tiebreaker,
    this.calendarEventId,
    this.seasonDisplay,
    this.dayNight,
    this.scheduledInnings,
    this.inningBreakLength,
    this.gamesInSeries,
    this.seriesGameNumber,
    this.seriesDescription,
    this.recordSource,
    this.ifNecessary,
    this.ifNecessaryDescription,
  });

  factory Game.fromJson(Map<String, dynamic> json) {

    dynamic status = Status.fromJson(json['status']);
    dynamic teams = TeamRecords.fromJson(json['teams']);
    dynamic venue = Venue.fromJson(json['venue']);
    dynamic content = Content.fromJson(json['content']);
    var gameDate = DateTime.parse(json['gameDate']);

    return Game(
      gamePk: json['gamePk'],
      link: json['link'],
      gameType: json['gameType'],
      season: json['season'],
      gameDate: gameDate,
      status: status,
      teams: teams,
      venue: venue,
      content: content,
      isTie: json['isTie'],
      gameNumber: json['gameNumber'],
      publicFacing: json['publicFacing'],
      doubleHeader: json['doubleHeader'],
      gamedayType: json['gamedayType'],
      tiebreaker: json['tiebreaker'],
      calendarEventId: json['calendarEventId'],
      seasonDisplay: json['seasonDisplay'],
      dayNight: json['dayNight'],
      scheduledInnings: json['scheduledInnings'],
      inningBreakLength: json['inningBreakLength'],
      gamesInSeries: json['gamesInSeries'],
      seriesGameNumber: json['seriesGameNumber'],
      seriesDescription: json['seriesDescription'],
      recordSource: json['recordSource'],
      ifNecessary: json['ifNecessary'],
      ifNecessaryDescription: json['ifNecessaryDescription'],
    );
  }
}

class Content {
  String link;

  Content({
    this.link,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      link: json['link'],
    );
  }
}

class Status {
  String abstractGameState;
  String codedGameState;
  String detailedState;
  String statusCode;
  String abstractGameCode;

  Status({
    this.abstractGameState,
    this.codedGameState,
    this.detailedState,
    this.statusCode,
    this.abstractGameCode,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      abstractGameState: json['abstractGameState'],
      codedGameState: json['codedGameState'],
      detailedState: json['detailedState'],
      statusCode: json['statusCode'],
      abstractGameCode: json['abstractGameCode'],
    );
  }
}

class TeamRecords {
  TeamRecord away;
  TeamRecord home;

  TeamRecords({
    this.away,
    this.home,
  });

  factory TeamRecords.fromJson(Map<String, dynamic> json) {
    dynamic away = TeamRecord.fromJson(json['away']);
    dynamic home = TeamRecord.fromJson(json['home']);

    return TeamRecords(
      away: away,
      home: home,
    );
  }
}

class TeamRecord {
  LeagueRecord leagueRecord;
  int score;
  Venue team;
  bool isWinner;
  bool splitSquad;
  int seriesNumber;

  TeamRecord({
    this.leagueRecord,
    this.score,
    this.team,
    this.isWinner,
    this.splitSquad,
    this.seriesNumber,
  });

  factory TeamRecord.fromJson(Map<String, dynamic> json) {

    return TeamRecord(
      leagueRecord: LeagueRecord.fromJson(json['leagueRecord']),
      score: json['score'],
      team: Venue.fromJson(json['team']),
      isWinner: json['isWinner'],
      splitSquad: json['splitSquad'],
      seriesNumber: json['seriesNumber'],
    );
  }
}

class LeagueRecord {
  int wins;
  int losses;
  String pct;

  LeagueRecord({
    this.wins,
    this.losses,
    this.pct,
  });

  factory LeagueRecord.fromJson(Map<String, dynamic> json) {
    return LeagueRecord(
      wins: json['wins'],
      losses: json['losses'],
      pct: json['pct'],
    );
  }
}

class Venue {
  int id;
  String name;
  String link;

  Venue({
    this.id,
    this.name,
    this.link,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}

class Defense {
  Catcher pitcher;
  Catcher catcher;
  Catcher first;
  Catcher second;
  Catcher third;
  Catcher shortstop;
  Catcher left;
  Catcher center;
  Catcher right;
  Venue team;

  Defense({
    this.pitcher,
    this.catcher,
    this.first,
    this.second,
    this.third,
    this.shortstop,
    this.left,
    this.center,
    this.right,
    this.team,
  });

  factory Defense.fromJson(Map<String, dynamic> json) {

    Catcher _pitcher = null;
    if(json != null && json.containsKey('pitcher')) {
      _pitcher = Catcher.fromJson(json['pitcher']);
    }
    Catcher _catcher = null;
    if(json != null && json.containsKey('catcher')) {
      _catcher = Catcher.fromJson(json['catcher']);
    }
    Catcher _first = null;
    if(json != null && json.containsKey('first')) {
      _first = Catcher.fromJson(json['first']);
    }
    Catcher _second = null;
    if(json != null && json.containsKey('second')) {
      _second = Catcher.fromJson(json['second']);
    }
    Catcher _third = null;
    if(json != null && json.containsKey('third')) {
      _third = Catcher.fromJson(json['third']);
    }
    Catcher _shortstop = null;
    if(json != null && json.containsKey('shortstop')) {
      _shortstop = Catcher.fromJson(json['shortstop']);
    }
    Catcher _left = null;
    if(json != null && json.containsKey('left')) {
      _left = Catcher.fromJson(json['left']);
    }
    Catcher _center = null;
    if(json != null && json.containsKey('center')) {
      _center = Catcher.fromJson(json['center']);
    }
    Catcher _right = null;
    if(json != null && json.containsKey('right')) {
      _right = Catcher.fromJson(json['right']);
    }
    Venue _team = null;
    if(json != null && json.containsKey('team')) {
      _team = Venue.fromJson(json['team']);
    }

    return Defense(
      pitcher : _pitcher,
      catcher : _catcher,
      first : _first,
      second : _second,
      third : _third,
      shortstop : _shortstop,
      left : _left,
      center : _center,
      right : _right,
      team : _team,
    );
  }
}

class Catcher {
  int id;
  String fullName;
  String link;

  Catcher({
    this.id,
    this.fullName,
    this.link,
  });

  factory Catcher.fromJson(Map<String, dynamic> json) {
    return Catcher(
      id : json['id'],
      fullName : json['fullName'],
      link : json['link'],
    );
  }
}

class Inning {
  int num;
  String ordinalNum;
  InningAway home;
  InningAway away;

  Inning({
    this.num,
    this.ordinalNum,
    this.home,
    this.away,
  });

  factory Inning.fromJson(Map<String, dynamic> json) {
    return Inning(
      num : json['num'],
      ordinalNum : json['ordinalNum'],
      home : InningAway.fromJson(json['home']),
      away : InningAway.fromJson(json['away']),
    );
  }
}

class InningAway {
  int runs;
  int hits;
  int errors;
  int leftOnBase;

  InningAway({
    this.runs,
    this.hits,
    this.errors,
    this.leftOnBase,
  });

  factory InningAway.fromJson(Map<String, dynamic> json) {
    return InningAway(
      runs : json['runs'],
      hits : json['hits'],
      errors : json['errors'],
      leftOnBase : json['leftOnBase'],
    );
  }
}

class LiveData {
  Linescore linescore;
  Boxscore boxscore;

  LiveData({
    this.linescore,
    this.boxscore,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) {

    Map<String, dynamic> liveDataFromJson = json['liveData'];

    Linescore _linescore = null;
    if(liveDataFromJson != null && liveDataFromJson.containsKey('linescore')) {
      _linescore = Linescore.fromJson(liveDataFromJson['linescore']);
    }

    Boxscore _boxscore = null;
    if(liveDataFromJson != null && liveDataFromJson.containsKey('boxscore')) {
      _boxscore = Boxscore.fromJson(liveDataFromJson['boxscore']);
    }

    return LiveData(
      linescore: _linescore,
      boxscore: _boxscore,
    );
  }
}

class Boxscore {
  GamesTeams teams;

  Boxscore({
    this.teams,
  });

  factory Boxscore.fromJson(Map<String, dynamic> json) {
    return Boxscore(
      teams: GamesTeams.fromJson(json['teams']),
    );
  }
}

class Info {
  Info();

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
    );
  }
}

class Player {
  Person person;
  String jerseyNumber;
  Position position;
  Stats stats;
  Status status;
  int parentTeamId;
  Stats seasonStats;
  Status gameStatus;
  List<Position> allPositions;
  String battingOrder;

  Player({
    this.person,
    this.jerseyNumber,
    this.position,
    this.stats,
    this.status,
    this.parentTeamId,
    this.seasonStats,
    this.gameStatus,
    this.allPositions,
    this.battingOrder,
  });

  factory Player.fromJson(Map<String, dynamic> json) {

    List<dynamic> allPositionsFromJson = json['allPositions'];
    List<Position> allPositions = new List<Position>();
    for(var i = 0; allPositionsFromJson != null && i < allPositionsFromJson.length; i++) {
      allPositions.add(Position.fromJson(allPositionsFromJson[i]));
    }

    return Player(
      person : Person.fromJson(json['person']),
      jerseyNumber : json['jerseyNumber'],
      position : Position.fromJson(json['position']),
      stats : Stats.fromJson(json['stats']),
      status : Status.fromJson(json['status']),
      parentTeamId : json['parentTeamId'],
      seasonStats : Stats.fromJson(json['seasonStats']),
      gameStatus : Status.fromJson(json['gameStatus']),
      allPositions : allPositions,
      battingOrder : json['battingOrder'],
    );
  }
}

class Linescore {
  LinescoreTeams teams;

  Linescore({
    this.teams,
  });

  factory Linescore.fromJson(Map<String, dynamic> json) {
    return Linescore(
      teams: LinescoreTeams.fromJson(json['teams']),
    );
  }
}

class LinescoreTeams {
  TentacledAway home;
  TentacledAway away;

  LinescoreTeams({
    this.home,
    this.away,
  });

  factory LinescoreTeams.fromJson(Map<String, dynamic> json) {
    return LinescoreTeams(
      home: TentacledAway.fromJson(json['home']),
      away: TentacledAway.fromJson(json['away']),
    );
  }
}

class TentacledAway {
  int runs;

  TentacledAway({
    this.runs,
  });

  factory TentacledAway.fromJson(Map<String, dynamic> json) {
    return TentacledAway(
      runs: json['runs'],
    );
  }
}

class Offense {
  Catcher batter;
  Catcher onDeck;
  Catcher inHole;
  Catcher first;
  Catcher pitcher;
  Venue team;

  Offense({
    this.batter,
    this.onDeck,
    this.inHole,
    this.first,
    this.pitcher,
    this.team,
  });

  factory Offense.fromJson(Map<String, dynamic> json) {
    Catcher _batter = null;
    if(json != null && json.containsKey('batter')) {
      _batter = Catcher.fromJson(json['batter']);
    }

    Catcher _onDeck = null;
    if(json != null && json.containsKey('onDeck')) {
      _onDeck = Catcher.fromJson(json['onDeck']);
    }

    Catcher _inHole = null;
    if(json != null && json.containsKey('inHole')) {
      _inHole = Catcher.fromJson(json['inHole']);
    }

    Catcher _first = null;
    if(json != null && json.containsKey('first')) {
      _first = Catcher.fromJson(json['first']);
    }

    Catcher _pitcher = null;
    if(json != null && json.containsKey('pitcher')) {
      _pitcher = Catcher.fromJson(json['pitcher']);
    }

    Venue _team = null;
    if(json != null && json.containsKey('team')) {
      _team = Venue.fromJson(json['team']);
    }

    return Offense(
      batter : _batter,
      onDeck : _onDeck,
      inHole : _inHole,
      first : _first,
      pitcher : _pitcher,
      team : _team,
    );
  }
}

class GamesTeams {
  StickyAway home;
  StickyAway away;

  GamesTeams({
    this.home,
    this.away,
  });

  factory GamesTeams.fromJson(Map<String, dynamic> json) {

    StickyAway _home = null;
    if(json != null && json.containsKey('home')) {
      _home = StickyAway.fromJson(json['home']);
    }

    StickyAway _away = null;
    if(json != null && json.containsKey('away')) {
      _away = StickyAway.fromJson(json['away']);
    }

    return GamesTeams(
      home : _home,
      away : _away,
    );
  }
}

class Team {
  int id;
  String name;
  String link;
  Venue venue;
  String teamCode;
  String fileCode;
  String abbreviation;
  String teamName;
  String locationName;
  String firstYearOfPlay;
  Venue league;
  Venue division;
  Venue sport;
  String shortName;
  Venue springLeague;
  String allStarStatus;
  bool active;

  Team({
    this.id,
    this.name,
    this.link,
    this.venue,
    this.teamCode,
    this.fileCode,
    this.abbreviation,
    this.teamName,
    this.locationName,
    this.firstYearOfPlay,
    this.league,
    this.division,
    this.sport,
    this.shortName,
    this.springLeague,
    this.allStarStatus,
    this.active,
  });

  factory Team.fromJson(Map<String, dynamic> json) {

    Venue venue = null;
    if(json.containsKey('venue')) {
      venue = Venue.fromJson(json['venue']);
    }

    Venue league = null;
    if(json.containsKey('league')) {
      league = Venue.fromJson(json['league']);
    }

    Venue division = null;
    if(json.containsKey('division')) {
      division = Venue.fromJson(json['division']);
    }

    Venue sport = null;
    if(json.containsKey('sport')) {
      sport = Venue.fromJson(json['sport']);
    }

    Venue springLeague = null;
    if(json.containsKey('springLeague')) {
      springLeague = Venue.fromJson(json['springLeague']);
    }

    return Team(
      id : json['id'],
      name : json['name'],
      link : json['link'],
      venue : venue,
      teamCode : json['teamCode'],
      fileCode : json['fileCode'],
      abbreviation : json['abbreviation'],
      teamName : json['teamName'],
      locationName : json['locationName'],
      firstYearOfPlay : json['firstYearOfPlay'],
      league : league,
      division : division,
      sport : sport,
      shortName : json['shortName'],
      springLeague : springLeague,
      allStarStatus : json['allStarStatus'],
      active : json['active'],
    );
  }
}

class Person {
  int id;
  String fullName;
  String link;
  String firstName;
  String lastName;
  String primaryNumber;
  DateTime birthDate;
  int currentAge;
  String birthCity;
  String birthStateProvince;
  String birthCountry;
  String height;
  int weight;
  bool active;
  Position primaryPosition;
  String useName;
  String middleName;
  String boxscoreName;
  String gender;
  bool isPlayer;
  bool isVerified;
  int draftYear;
  BatSide batSide;
  BatSide pitchHand;
  String nameFirstLast;
  String nameSlug;
  String firstLastName;
  String lastFirstName;
  String lastInitName;
  String initLastName;
  String fullFmlName;
  String fullLfmName;
  double strikeZoneTop;
  double strikeZoneBottom;

  Person({
    this.id,
    this.fullName,
    this.link,
    this.firstName,
    this.lastName,
    this.primaryNumber,
    this.birthDate,
    this.currentAge,
    this.birthCity,
    this.birthStateProvince,
    this.birthCountry,
    this.height,
    this.weight,
    this.active,
    this.primaryPosition,
    this.useName,
    this.middleName,
    this.boxscoreName,
    this.gender,
    this.isPlayer,
    this.isVerified,
    this.draftYear,
    this.batSide,
    this.pitchHand,
    this.nameFirstLast,
    this.nameSlug,
    this.firstLastName,
    this.lastFirstName,
    this.lastInitName,
    this.initLastName,
    this.fullFmlName,
    this.fullLfmName,
    this.strikeZoneTop,
    this.strikeZoneBottom,
  });

  factory Person.fromJson(Map<String, dynamic> json) {

    var birthDate = null;
    if(json.containsKey('birthDate')) {
      birthDate = DateTime.parse(json['birthDate']);
    }

    Position position = null;
    if(json.containsKey('primaryPosition')) {
      position = Position.fromJson(json['primaryPosition']);
    }

    BatSide batSide = null;
    if(json.containsKey('batSide')) {
      batSide = BatSide.fromJson(json['batSide']);
    }

    BatSide pitchHand = null;
    if(json.containsKey('pitchHand')) {
      pitchHand = BatSide.fromJson(json['pitchHand']);
    }

    return Person(
      id : json['id'],
      fullName : json['fullName'],
      link : json['link'],
      firstName : json['firstName'],
      lastName : json['lastName'],
      primaryNumber : json['primaryNumber'],
      birthDate : birthDate,
      currentAge : json['currentAge'],
      birthCity : json['birthCity'],
      birthStateProvince : json['birthStateProvince'],
      birthCountry : json['birthCountry'],
      height : json['height'],
      weight : json['weight'],
      active : json['active'],
      primaryPosition : position,
      useName : json['useName'],
      middleName : json['middleName'],
      boxscoreName : json['boxscoreName'],
      gender : json['gender'],
      isPlayer : json['isPlayer'],
      isVerified : json['isVerified'],
      draftYear : json['draftYear'],
      batSide : batSide,
      pitchHand : pitchHand,
      nameFirstLast : json['nameFirstLast'],
      nameSlug : json['nameSlug'],
      firstLastName : json['firstLastName'],
      lastFirstName : json['lastFirstName'],
      lastInitName : json['lastInitName'],
      initLastName : json['initLastName'],
      fullFmlName : json['fullFmlName'],
      fullLfmName : json['fullLfmName'],
      strikeZoneTop : json['strikeZoneTop'],
      strikeZoneBottom : json['strikeZoneBottom'],
    );
  }
}

class BatSide {
  String code;
  String description;

  BatSide({
    this.code,
    this.description,
  });

  factory BatSide.fromJson(Map<String, dynamic> json) {
    return BatSide(
      code : json['code'],
      description : json['description'],
    );
  }
}

class Position {
  String code;
  String name;
  String type;
  String abbreviation;

  Position({
    this.code,
    this.name,
    this.type,
    this.abbreviation,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      code : json['code'],
      name : json['name'],
      type : json['type'],
      abbreviation : json['abbreviation'],
    );
  }
}

class SeasonStats {
  Batting batting;
  Pitching pitching;
  Fielding fielding;

  SeasonStats({
    this.batting,
    this.pitching,
    this.fielding,
  });

  factory SeasonStats.fromJson(Map<String, dynamic> json) {
    return SeasonStats(
      batting : Batting.fromJson(json['batting']),
      pitching : Pitching.fromJson(json['pitching']),
      fielding : Fielding.fromJson(json['fielding']),
    );
  }
}

class Batting {
  int runs;
  int doubles;
  int triples;
  int homeRuns;
  int strikeOuts;
  int baseOnBalls;
  int hits;
  String avg;
  int atBats;
  String obp;
  int rbi;
  String inningsPitched;

  Batting({
    this.runs,
    this.doubles,
    this.triples,
    this.homeRuns,
    this.strikeOuts,
    this.baseOnBalls,
    this.hits,
    this.avg,
    this.atBats,
    this.obp,
    this.rbi,
    this.inningsPitched,
  });

  factory Batting.fromJson(Map<String, dynamic> json) {
    return Batting(
      runs : json['runs'],
      doubles : json['doubles'],
      triples : json['triples'],
      homeRuns : json['homeRuns'],
      strikeOuts : json['strikeOuts'],
      baseOnBalls : json['baseOnBalls'],
      hits : json['hits'],
      avg : json['avg'],
      atBats : json['atBats'],
      obp : json['obp'],
      rbi : json['rbi'],
      inningsPitched : json['inningsPitched'],
    );
  }
}

class Fielding {
  int assists;
  int putOuts;
  int errors;
  String fielding;

  Fielding({
    this.assists,
    this.putOuts,
    this.errors,
    this.fielding,
  });

  factory Fielding.fromJson(Map<String, dynamic> json) {
    return Fielding(
      assists : json['assists'],
      putOuts : json['putOuts'],
      errors : json['errors'],
      fielding : json['fielding'],
    );
  }
}

class Pitching {
  int runs;
  int doubles;
  int triples;
  int homeRuns;
  int strikeOuts;
  int baseOnBalls;
  int hits;
  String avg;
  int atBats;
  String obp;
  String inningsPitched;
  int wins;
  int losses;
  int balls;
  int strikes;
  int rbi;

  Pitching({
    this.runs,
    this.doubles,
    this.triples,
    this.homeRuns,
    this.strikeOuts,
    this.baseOnBalls,
    this.hits,
    this.avg,
    this.atBats,
    this.obp,
    this.inningsPitched,
    this.wins,
    this.losses,
    this.balls,
    this.strikes,
    this.rbi,
  });

  factory Pitching.fromJson(Map<String, dynamic> json) {
    return Pitching(
      runs : json['runs'],
      doubles : json['doubles'],
      triples : json['triples'],
      homeRuns : json['homeRuns'],
      strikeOuts : json['strikeOuts'],
      baseOnBalls : json['baseOnBalls'],
      hits : json['hits'],
      avg : json['avg'],
      atBats : json['atBats'],
      obp : json['obp'],
      inningsPitched : json['inningsPitched'],
      wins : json['wins'],
      losses : json['losses'],
      balls : json['balls'],
      strikes : json['strikes'],
      rbi : json['rbi'],
    );
  }
}

class Stats {
  Batting batting;
  Pitching pitching;
  Fielding fielding;

  Stats({
    this.batting,
    this.pitching,
    this.fielding,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {

    Batting batting = null;
    if(json.containsKey('batting')) {
      batting = Batting.fromJson(json['batting']);
    }

    Pitching pitching = null;
    if(json.containsKey('pitching')) {
      pitching = Pitching.fromJson(json['pitching']);
    }

    Fielding fielding = null;
    if(json.containsKey('fielding')) {
      fielding = Fielding.fromJson(json['fielding']);
    }

    return Stats(
      batting : batting,
      pitching : pitching,
      fielding : fielding,
    );
  }
}

class PurpleTeam {
  String name;
  String abbreviation;
  Record record;

  PurpleTeam({
    this.name,
    this.abbreviation,
    this.record,
  });

  factory PurpleTeam.fromJson(Map<String, dynamic> json) {
    return PurpleTeam(
      name : json['name'],
      abbreviation : json['abbreviation'],
      record : Record.fromJson(json['record']),
    );
  }
}

class Record {
  int wins;
  int losses;

  Record({
    this.wins,
    this.losses,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      wins : json['wins'],
      losses : json['losses'],
    );
  }
}

class TeamStats {
  Batting batting;
  Pitching pitching;
  Fielding fielding;

  TeamStats({
    this.batting,
    this.pitching,
    this.fielding,
  });

  factory TeamStats.fromJson(Map<String, dynamic> json) {
    Batting batting = null;
    if(json.containsKey('batting')) {
      batting = Batting.fromJson(json['batting']);
    }

    Pitching pitching = null;
    if(json.containsKey('pitching')) {
      pitching = Pitching.fromJson(json['pitching']);
    }

    Fielding fielding = null;
    if(json.containsKey('fielding')) {
      fielding = Fielding.fromJson(json['fielding']);
    }

    return TeamStats(
      batting : batting,
      pitching : pitching,
      fielding : fielding,
    );
  }
}

class StickyAway {
  int runs;
  int hits;
  int errors;
  int leftOnBase;
  Team team;
  TeamStats teamStats;
//  Players players;
  List<Player> batters;
  List<Player> pitchers;
  List<Player> bench;
  List<Player> bullpen;
  List<Player> battingOrder;
  List<Info> info;
//  List<Player> note;

  StickyAway({
    this.runs,
    this.hits,
    this.errors,
    this.leftOnBase,
    this.team,
    this.teamStats,
//    this.players,
    this.batters,
    this.pitchers,
    this.bench,
    this.bullpen,
    this.battingOrder,
    this.info,
//    this.note,
  });

  factory StickyAway.fromJson(Map<String, dynamic> json) {

    Map<String, dynamic> players = null;
    if(json.containsKey('players')) {
      players = json['players'];
    }

    List<Player> batters = null;
    List<Player> pitchers = null;
    List<Player> bench = null;
    List<Player> bullpen = null;
    List<Player> battingOrder = null;
    if(null != players) {

      batters = new List<Player>();
      List<dynamic> battersFromJson = json['batters'];
      for(var i = 0; battersFromJson != null && i < battersFromJson.length; i++) {
        int id = battersFromJson[i];
        String key = "ID" + id.toString();
        if(players.containsKey(key)) {
          Player value = Player.fromJson(players[key]);
          value.person.id = id;
          batters.add(value);
        }
      }

      pitchers = new List<Player>();
      List<dynamic> pitchersFromJson = json['pitchers'];
      for(var i = 0; pitchersFromJson != null && i < pitchersFromJson.length; i++) {
        int id = pitchersFromJson[i];
        String key = "ID" + id.toString();
        if(players.containsKey(key)) {
          Player value = Player.fromJson(players[key]);
          value.person.id = id;
          pitchers.add(value);
        }
      }

      bench = new List<Player>();
      List<dynamic> benchFromJson = json['bench'];
      for(var i = 0; benchFromJson != null && i < benchFromJson.length; i++) {
        int id = benchFromJson[i];
        String key = "ID" + id.toString();
        if(players.containsKey(key)) {
          Player value = Player.fromJson(players[key]);
          value.person.id = id;
          bench.add(value);
        }
      }

      bullpen = new List<Player>();
      List<dynamic> bullpenFromJson = json['bullpen'];
      for(var i = 0; bullpenFromJson != null && i < bullpenFromJson.length; i++) {
        int id = bullpenFromJson[i];
        String key = "ID" + id.toString();
        if(players.containsKey(key)) {
          Player value = Player.fromJson(players[key]);
          value.person.id = id;
          bullpen.add(value);
        }
      }

      battingOrder = new List<Player>();
      List<dynamic> battingOrderFromJson = json['battingOrder'];
      for(var i = 0; battingOrderFromJson != null && i < battingOrderFromJson.length; i++) {
        int id = battingOrderFromJson[i];
        String key = "ID" + id.toString();
        if(players.containsKey(key)) {
          Player value = Player.fromJson(players[key]);
          value.person.id = id;
          battingOrder.add(value);
        }
      }
    }

    List<dynamic> infoFromJson = json['info'];
    List<Info> info = new List<Info>();
    for(var i = 0; infoFromJson != null && i < infoFromJson.length; i++) {
      info.add(Info.fromJson(infoFromJson[i]));
    }

    Team team = null;
    if(json.containsKey('team')) {
      team = Team.fromJson(json['team']);
    }

    TeamStats teamStats = null;
    if(json.containsKey('teamStats')) {
      teamStats = TeamStats.fromJson(json['teamStats']);
    }

    return StickyAway(
      runs : json['runs'],
      hits : json['hits'],
      errors : json['errors'],
      leftOnBase : json['leftOnBase'],
      team : team,
      teamStats : teamStats,
//      players : Players.fromJson(json['players']),
      batters : batters,
      pitchers : pitchers,
      bench : bench,
      bullpen : bullpen,
      battingOrder : battingOrder,
      info : info,
//      note : note,
    );
  }
}

class Players {
  Player id429665;
  Player id518934;
  Player id622663;
  Player id544928;
  Player id519222;
  Player id493603;
  Player id592450;
  Player id642528;
  Player id572020;
  Player id570482;
  Player id502154;
  Player id547888;
  Player id457727;
  Player id650402;
  Player id458731;
  Player id642180;
  Player id643338;
  Player id592454;
  Player id519317;
  Player id570666;
  Player id572228;
  Player id596142;
  Player id457918;
  Player id547973;
  Player id544369;

  Players({
    this.id429665,
    this.id518934,
    this.id622663,
    this.id544928,
    this.id519222,
    this.id493603,
    this.id592450,
    this.id642528,
    this.id572020,
    this.id570482,
    this.id502154,
    this.id547888,
    this.id457727,
    this.id650402,
    this.id458731,
    this.id642180,
    this.id643338,
    this.id592454,
    this.id519317,
    this.id570666,
    this.id572228,
    this.id596142,
    this.id457918,
    this.id547973,
    this.id544369,
  });
}
