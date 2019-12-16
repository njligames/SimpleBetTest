import 'package:flutter/cupertino.dart';
import 'model.dart';

class PlayerNameView {
  String _fullName;

  PlayerNameView();

  void set fullName(String n) {
    if(null != n && (n.split(" ").length == 2))
      _fullName = n;
    else
      _fullName = "FIRST LAST";
  }

  String get fullName {
    return _fullName;
  }

  String firstName() {
    if(null != _fullName) {
      return _fullName.split(" ")[0];
    }
    return "";
  }

  String lastName() {

    if(null != _fullName) {
      var split = _fullName.split(" ");
      if(split.length > 1)
        return split[1];
    }
    return "";
  }

  String displayName() {
    String fname = this.firstName();
    String f = fname[0];
    return f + ". " + this.lastName();
  }
}
class BattingView extends PlayerNameView{
  String _positionAbbreviation;
  int _AB;
  int _R;
  int _H;
  int _RBI;

  void set positionAbbreviation(String n) {
    if(null != n)
      _positionAbbreviation = n;
    else
      _positionAbbreviation = "???";
  }

  String get positionAbbreviation {
    return _positionAbbreviation;
  }

  void set AB(int n) {
    if(null != n)
      _AB = n;
    else
      _AB = 0;
  }

  int get AB {
    return _AB;
  }

  void set R(int n) {
    if(null != n)
      _R = n;
    else
      _R = 0;
  }

  int get R {
    return _R;
  }

  void set H(int n) {
    if(null != n)
      _H = n;
    else
      _H = 0;
  }

  int get H {
    return _H;
  }

  void set RBI(int n) {
    if(null != n)
      _RBI = n;
    else
      _RBI = 0;
  }

  int get RBI {
    return _RBI;
  }

  BattingView();

  static List<BattingView> populateBattingList(List<Player> lst) {
    List<BattingView> viewLst = new List<BattingView>();

    for(int i = 0; i < lst.length; i++) {
      Player player = lst[i];
      String fullName = player.person.fullName;
      String positionAbbreviation = player.position.abbreviation;
      int AB = player.stats.batting.atBats;
      int R = player.stats.batting.runs;
      int H = player.stats.batting.hits;
      int RBI = player.stats.batting.rbi;

      if(null != AB && AB > 0) {

        BattingView bView = new BattingView();
        bView.fullName = fullName;
        bView.positionAbbreviation = positionAbbreviation;
        bView.AB = AB;
        bView.R = R;
        bView.H = H;
        bView.RBI = RBI;

        viewLst.add(bView);
      }
    }

    return viewLst;
  }
}




class BattersView {
  List<BattingView> batters;

  BattersView({this.batters});

  void addBatterView(BattingView batter) {
    batters.add(batter);
  }

  int getABSum() {
    int sum = 0;

    for(int i = 0; i < batters.length; i++) {
      sum += batters[i].AB;
    }

    return sum;
  }

  int getRSum() {
    int sum = 0;

    for(int i = 0; i < batters.length; i++) {
      sum += batters[i].R;
    }

    return sum;
  }

  int getHSum() {
    int sum = 0;

    for(int i = 0; i < batters.length; i++) {
      sum += batters[i].H;
    }

    return sum;
  }

  int getRBISum() {
    int sum = 0;

    for(int i = 0; i < batters.length; i++) {
      sum += batters[i].RBI;
    }

    return sum;
  }
}

class PitchingView extends PlayerNameView {
  double _IP;
  int _H;
  int _R;
  int _K;

  void set IP(double n) {
    if(null != n)
      _IP = n;
    else
      _IP = 0;
  }

  double get IP {
    return _IP;
  }

  void set H(int n) {
    if(null != n)
      _H = n;
    else
      _H = 0;
  }

  int get H {
    return _H;
  }

  void set R(int n) {
    if(null != n)
      _R = n;
    else
      _R = 0;
  }

  int get R {
    return _R;
  }

  void set K(int n) {
    if(null != n)
      _K = n;
    else
      _K = 0;
  }

  int get K {
    return _K;
  }

  PitchingView();

  static List<PitchingView> populatePitchingList(List<Player> lst) {
    List<PitchingView> viewLst = new List<PitchingView>();

    for(int i = 0; i < lst.length; i++) {
      Player player = lst[i];
      String fullName = player.person.fullName;
      double IP = double.parse(player.stats.pitching.inningsPitched) ;
      int H = player.stats.pitching.hits;
      int R = player.stats.pitching.runs;
      int K = player.stats.pitching.strikeOuts;

      if(null != IP && IP > 0.0) {
        PitchingView pView = new PitchingView();
        pView.fullName = fullName;
        pView.IP = IP;
        pView.H = H;
        pView.R = R;
        pView.K = K;

        viewLst.add(pView);
      }
    }

    return viewLst;
  }
}

class PitchersView {
  List<PitchingView> pitchers;

  PitchersView({this.pitchers});

  void addBatterView(PitchingView batter) {
    pitchers.add(batter);
  }

  double getIPSum() {
    double sum = 0;

    for(int i = 0; i < pitchers.length; i++) {
      sum += pitchers[i].IP;
    }

    return sum;
  }

  int getHSum() {
    int sum = 0;

    for(int i = 0; i < pitchers.length; i++) {
      sum += pitchers[i].H;
    }

    return sum;
  }

  int getRSum() {
    int sum = 0;

    for(int i = 0; i < pitchers.length; i++) {
      sum += pitchers[i].R;
    }

    return sum;
  }

  int getKSum() {
    int sum = 0;

    for(int i = 0; i < pitchers.length; i++) {
      sum += pitchers[i].K;
    }

    return sum;
  }
}





class InningView {
  int _num;
  int _runs;
  int _hits;
  int _errors;

//  InningView({this._num, this._runs, this._hits, this._errors});

  void set num(int n) {
    if(null != n)
      _num = n;
    else
      _num = 0;
  }

  int get num {
    return _num;
  }

  void set runs(int n) {
    if(null != n)
      _runs = n;
    else
      _runs = 0;
  }

  int get runs {
    return _runs;
  }

  void set hits(int n) {
    if(null != n)
      _hits = n;
    else
      _hits = 0;
  }

  int get hits {
    return _hits;
  }

  void set errors(int n) {
    if(null != n)
      _errors = n;
    else
      _errors = 0;
  }

  int get errors {
    return _errors;
  }
}

class InningsView {
  List<InningView> innings;

  InningsView({this.innings});

  void addInningView(InningView iView) {
    innings.add(iView);
  }

  int getRuns() {
    int sum = 0;

    for(int i = 0; i < innings.length; i++) {
      if(null != innings[i].runs)
        sum += innings[i].runs;
    }

    return sum;
  }

  int getHits() {
    int sum = 0;

    for(int i = 0; i < innings.length; i++) {
      if(null != innings[i].hits)
        sum += innings[i].hits;
    }

    return sum;
  }

  int getErrors() {
    int sum = 0;

    for(int i = 0; i < innings.length; i++) {
      if(null != innings[i].errors)
        sum += innings[i].errors;
    }

    return sum;
  }

  List<int> getRunList() {
    List<int> runs = new List<int>();

    for(int i = 0; i < innings.length; i++) {
      if(null != innings[i].runs)
        runs.add(innings[i].runs);
      else
        runs.add(0);
    }

    return runs;
  }
}

class TeamView {
  Team team;
  int _teamScore;

  TeamView({this.team});

  void set teamScore(int n) {
    if(null != n)
      _teamScore = n;
    else
      _teamScore = 0;
  }

  int get teamScore {
    return _teamScore;
  }

  Image getImage() {
    Image ret = Image.asset('assets/images/' + this.team.id.toString() + '.png', alignment: Alignment.center,);

    return ret;
  }

  static Map<int, Team> buildTeamsMap(List<Team> allTeams) {
    Map<int, Team> ret = new Map<int, Team>();

    for(int i = 0; i < allTeams.length; i++) {
      ret[allTeams[i].id] = allTeams[i];
    }

    return ret;
  }
}

class GameView {
  int gameId;
  TeamView home;
  TeamView away;

  GameView({this.gameId, this.home, this.away});
}

