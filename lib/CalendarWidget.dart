import 'package:flutter/material.dart';
import 'model.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'ScheduledGames.dart';

class CalendarWidget extends StatefulWidget {
  List<Team> teams;

  CalendarWidget({this.teams});

  @override
  CalendarWidgetState createState() => CalendarWidgetState(teams: this.teams);
}

class CalendarWidgetState extends State<CalendarWidget> {
  List<Team> teams;

  CalendarWidgetState({this.teams});

  final _biggerFont = const TextStyle(fontSize: 24.0);

  static const Color textColor = Color(0xFF000000);
  static const Color labelColor = Color(0xFFf0f0f0);
  static const Color contentColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFFFDFDFDF);

  Widget _buildCalendarWidget(BuildContext context) {
    var _currentDate = DateTime.parse("20190929");
    var _markedDateMap;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(

        todayBorderColor : borderColor,
        todayButtonColor : borderColor,
        selectedDayBorderColor : textColor,
        selectedDayButtonColor : textColor,
        iconColor : textColor,


        onDayPressed: (DateTime date, List<EventInterface> f) {
          _currentDate = date;

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScheduledGames(dateTime: _currentDate, teams: this.teams)),
          );
        },
        thisMonthDayBorderColor: Colors.black,
        height: 420.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
        markedDatesMap: _markedDateMap,
      ),
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if(0 == i) {
            return Center(child: Text('MLB Game Statistics', style: _biggerFont,));
          } else if(1 == i) {
            return _buildCalendarRow(context);
          }
        });
  }

  Widget _buildCalendarRow(BuildContext context) {
    return ListTile(
      title: _buildCalendarWidget(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleBet - James Folk'),
      ),
      body: _buildSuggestions(context),
    );
  }
}
