import 'dart:async';
import 'package:flutter/material.dart';
import 'model.dart';
import 'CalendarWidget.dart';
import 'MLBUtil.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Team>> teams;

  @override
  void initState() {
    super.initState();

    teams = MLBUtil.fetchTeams();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000000,
          const <int, Color>{
            50: const Color(0xFF000000),
            100: const Color(0xFF000000),
            200: const Color(0xFF000000),
            300: const Color(0xFF000000),
            400: const Color(0xFF000000),
            500: const Color(0xFF000000),
            600: const Color(0xFF000000),
            700: const Color(0xFF000000),
            800: const Color(0xFF000000),
            900: const Color(0xFF000000),
          },
        ),
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Team>>(
            future: teams,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CalendarWidget(teams: snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}