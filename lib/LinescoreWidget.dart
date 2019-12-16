import 'package:flutter/material.dart';

class LinescoreWidget extends StatelessWidget {

  LinescoreWidget(this.homeTeamName,
      this.awayTeamName,
      this.homeTeamScores,
      this.homeTeamRuns,
      this.homeTeamHits,
      this.homeTeamErrors,
      this.awayTeamScores,
      this.awayTeamRuns,
      this.awayTeamHits,
      this.awayTeamErrors,
      this.numInnings, {Key key}) : super(key: key);

  String homeTeamName;
  String awayTeamName;

  List<int> homeTeamScores;
  int homeTeamRuns;
  int homeTeamHits;
  int homeTeamErrors;

  List<int> awayTeamScores;
  int awayTeamRuns;
  int awayTeamHits;
  int awayTeamErrors;

  int numInnings;

  static const Color textColor = Color(0xFF000000);
  static const Color labelColor = Color(0xFFf0f0f0);
  static const Color contentColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFFFDFDFDF);

  static const double borderWidth = 0.3;

  static const TextStyle hiliteTextStyle = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Arial',
    letterSpacing: 0,
    fontSize: 8,
    height: 2,
  );

  static const TextStyle labelTextStyle = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w200,
    fontFamily: 'Arial',
    letterSpacing: 0,
    fontSize: 8,
    height: 2,
  );

  static const TextStyle descTextStyle = TextStyle(
    color: textColor,
    fontWeight: FontWeight.w200,
    fontFamily: 'Arial',
    letterSpacing: 0,
    fontSize: 8,
    height: 2,
  );

  Container _buildCell(String text, TextStyle style, Color backgroundColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: borderWidth, color: borderColor),
          left: BorderSide(width: borderWidth, color: borderColor),
          right: BorderSide(width: borderWidth, color: borderColor),
          bottom: BorderSide(width: borderWidth, color: borderColor),
        ),
        color: backgroundColor,
      ),
      child: Text(text, textAlign: TextAlign.center, style: style),
    );
  }

  SizedBox _idxToValue(BuildContext context, int idx) {

    Container _container = null;

    if(idx == 0) {
      _container = Container(
        child: _buildCell(" ", labelTextStyle, labelColor),
      );
    } else if(idx > 0 && idx <= numInnings) {
      _container = Container(
        child: _buildCell(idx.toString(), labelTextStyle, labelColor),
      );
    } else if(idx == (numInnings + 1)) {
      _container = Container(
        child: _buildCell("R", hiliteTextStyle, labelColor),
      );
    } else if(idx == (numInnings + 2)) {
      _container = Container(
        child: _buildCell("H", hiliteTextStyle, labelColor),
      );
    } else if(idx == (numInnings + 3)) {
      _container = Container(
        child: _buildCell("E", hiliteTextStyle, labelColor),
      );
    } else if(idx == (numInnings + 4)) {
      _container = Container(
        child: _buildCell(homeTeamName, hiliteTextStyle, labelColor),
      );
    } else if(idx == ((numInnings + 4) + (numInnings + 4))) {
      _container = Container(
        child: _buildCell(awayTeamName, hiliteTextStyle, labelColor),
      );
    } else if(idx > (numInnings + 4) && idx <= ((numInnings + 4) + numInnings)) {
      _container = Container(
        child: _buildCell(homeTeamScores[idx - (numInnings + 4) - 1].toString(), descTextStyle, contentColor),
      );
    } else if(idx > ((numInnings + 4) + (numInnings + 4)) && idx <= (((numInnings + 4) + (numInnings + 4)) + numInnings)) {
      _container = Container(
        child: _buildCell(awayTeamScores[idx - ((numInnings + 4) + (numInnings + 4)) - 1].toString(), descTextStyle, contentColor),
      );
    } else if(idx == ((numInnings + 4) + numInnings + 1)) {
      _container = Container(
        child: _buildCell(homeTeamRuns.toString(), hiliteTextStyle, contentColor),
      );
    } else if(idx == ((numInnings + 4) + numInnings + 2)) {
      _container = Container(
        child: _buildCell(homeTeamHits.toString(), hiliteTextStyle, contentColor),
      );
    } else if(idx == ((numInnings + 4) + numInnings + 3)) {
      _container = Container(
        child: _buildCell(homeTeamErrors.toString(), hiliteTextStyle, contentColor),
      );
    } else if(idx == (((numInnings + 4) + (numInnings + 4)) + numInnings + 1)) {
      _container = Container(
        child: _buildCell(awayTeamRuns.toString(), hiliteTextStyle, contentColor),
      );
    } else if(idx == (((numInnings + 4) + (numInnings + 4)) + numInnings + 2)) {
      _container = Container(
        child: _buildCell(awayTeamHits.toString(), hiliteTextStyle, contentColor),
      );
    } else if(idx == (((numInnings + 4) + (numInnings + 4)) + numInnings + 3)) {
      _container = Container(
        child: _buildCell(awayTeamErrors.toString(), hiliteTextStyle, contentColor),
      );
    } else {
      _container = Container(
        child: _buildCell("?", descTextStyle, labelColor),
      );
    }

    return SizedBox.expand( child: _container, );
  }

  @override
  Widget build(BuildContext context) {
    final total = (numInnings + 4) * 3;

    return Center(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: (numInnings + 4),
        crossAxisSpacing: 0,

        children: List.generate(total, (idx) {
          return Center(
              child: _idxToValue(context, idx)
          );
        }),
      ),
    );
  }
}