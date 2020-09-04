import 'package:flutter/material.dart';
class Result extends StatefulWidget {
  Result({Key key,@required this.score}):super(key:key);
  int score;
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Result result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("$result.score"),
        )      ),
    );
  }
}

