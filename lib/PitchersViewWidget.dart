import 'package:flutter/material.dart';
import 'view.dart';

class PitchersViewWidget extends StatelessWidget {

  PitchersView pitchersView;

  PitchersViewWidget(this.pitchersView, {Key key}) : super(key: key);

  static const Color textColor = Color(0xFF000000);
  static const Color labelColor = Color(0xFFf0f0f0);
  static const Color contentColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFFFDFDFDF);

  static const double borderWidth = 0.5;

  final double itemHeight = 20;
  final double itemWidth = 70;

  final int numColumns = 5;

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

  Container _buildCell(String text, TextStyle style, Color backgroundColor, TextAlign align) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: borderWidth, color: borderColor),
          left: BorderSide(width: borderWidth, color: backgroundColor),
          right: BorderSide(width: borderWidth, color: backgroundColor),
          bottom: BorderSide(width: borderWidth, color: borderColor),
        ),
        color: backgroundColor,
      ),
      child: Text(text, textAlign: align, style: style),
    );
  }

  bool _shouldPopulateCell(int idx, int numRows, int column) {
    //adding 2 more because of the title and the sum rows.
    for(int i = 0; i < this.pitchersView.pitchers.length + 2; i++) {
      if((numRows * i + column) == idx) {
        return true;
      }
    }
    return false;
  }

  SizedBox idxToValue(BuildContext context, int idx) {

    Container _container = Container(
      child: _buildCell("", descTextStyle, contentColor, TextAlign.center),
    );

    bool shouldUseLabelColor = false;

    Color currentColor = contentColor;
    int v = (idx / numColumns).toInt();
    if(v % 2 == 0) {
      currentColor = labelColor;
    }

    if(idx == 0) {
      _container = Container(
        child: _buildCell("PITCHERS", hiliteTextStyle, currentColor, TextAlign.center),
      );
    } else if(idx == 1) {
      _container = Container(
        child: _buildCell("IP", hiliteTextStyle, currentColor, TextAlign.right),
      );
    } else if(idx == 2) {
      _container = Container(
        child: _buildCell("H", hiliteTextStyle, currentColor, TextAlign.right),
      );
    } else if(idx == 3) {
      _container = Container(
        child: _buildCell("R", hiliteTextStyle, currentColor, TextAlign.right),
      );
    } else if(idx == 4) {
      _container = Container(
        child: _buildCell("K", hiliteTextStyle, currentColor, TextAlign.right),
      );
    } else {

      int index = ((idx / numColumns) - 1).toInt();

      if(index < this.pitchersView.pitchers.length) {
        PitchingView pitcher = this.pitchersView.pitchers[index];

        if( 0 == (idx % numColumns)) {

          _container = Container(
            child: _buildCell(pitcher.displayName(), descTextStyle, currentColor, TextAlign.center),
          );

        } else if(_shouldPopulateCell(idx, numColumns, 1)) {

          _container = Container(
            child: _buildCell(pitcher.IP.toString(), descTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 2)) {

          _container = Container(
            child: _buildCell(pitcher.H.toString(), descTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 3)) {

          _container = Container(
            child: _buildCell(pitcher.R.toString(), descTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 4)) {

          _container = Container(
            child: _buildCell(pitcher.K.toString(), descTextStyle, currentColor, TextAlign.right),
          );
        }
      } else {

        if( 0 == (idx % numColumns)) {

          _container = Container(
            child: _buildCell("TEAM", hiliteTextStyle, currentColor, TextAlign.center),
          );

        } else if(_shouldPopulateCell(idx, numColumns, 1)) {

          _container = Container(
            child: _buildCell(this.pitchersView.getIPSum().toString(), hiliteTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 2)) {

          _container = Container(
            child: _buildCell(this.pitchersView.getHSum().toString(), hiliteTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 3)) {

          _container = Container(
            child: _buildCell(this.pitchersView.getRSum().toString(), hiliteTextStyle, currentColor, TextAlign.right),
          );
        } else if(_shouldPopulateCell(idx, numColumns, 4)) {

          _container = Container(
            child: _buildCell(this.pitchersView.getKSum().toString(), hiliteTextStyle, currentColor, TextAlign.right),
          );
        }

      }
    }


    return SizedBox(height: itemHeight, width: itemWidth, child: _container, );
  }

  @override
  Widget build(BuildContext context) {


    final total = numColumns * (pitchersView.pitchers.length + 2);

    return Center(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: (numColumns),
        crossAxisSpacing: 0,
        childAspectRatio: (itemWidth / itemHeight),
        controller: new ScrollController(keepScrollOffset: false),

        scrollDirection: Axis.vertical,

        children: List.generate(total, (idx) {
          return Center(
              child: idxToValue(context, idx)
          );
        }),
      ),
    );
  }
}