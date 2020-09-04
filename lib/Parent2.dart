import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newgame/RoundedButton.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:newgame/Parent3.dart';

class Parent2 extends StatefulWidget {
  Parent2({Key key/*,@required this.marks1*/}):super(key:key);
//int marks1;
  @override
  State<StatefulWidget> createState() {
    return Parent2State();
  }
}
class Parent2State extends State<Parent2> {
  int _counter3=7;
  Timer _timer3;
 // Parent2 parent2;


  void playsound() {
    final player = AudioCache();
    player.play('q.mp3');
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Builder(
                  builder: (BuildContext context) =>
                      RaisedButton.icon(
                        onPressed:(){
                          playsound();
                          _counter3=7;
                          if(_timer3 != null)
                          {
                            _timer3.cancel();
                          }
                          _timer3=Timer.periodic(Duration(seconds:1), (timer) {
                            setState(() {
                              if(_counter3>0){_counter3--;}
                              else
                              {
                                _timer3.cancel();

                                Navigator.push(context,MaterialPageRoute(builder: (context) => Parent3(/*marks2:parent2.marks1*/)));
                              }
                            });
                          });
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        icon: Icon(Icons.play_circle_outline,color:Colors.pink),
                        label: Text("Play",style:TextStyle(color:Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        color:Colors.teal,
                      ),
                ),
              ),
              Expanded(
                flex:1,
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "click this button and identify which alphabet is this",
                    style:TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:EdgeInsets.only(right:40,left:40),
                            child: RoundedButton(colour:Colors.indigo,title: "L",onPressed:(){ /* parent2.marks1=parent2.marks1-5;*/
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Parent3(/*marks2:parent2.marks1 ,*/)));} ),
                          ),
                          RoundedButton(colour:Colors.deepPurple,title: "N",onPressed:(){ /*parent2.marks1=parent2.marks1-5;*/
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent3(/*marks2: parent2.marks1,*/)));}),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right:40,left:40),
                            child: RoundedButton(colour:Colors.deepPurple,title: "Q",onPressed:(){/*parent2.marks1=parent2.marks1+10;*/
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Parent3(/*marks2: parent2.marks1,*/)));}),
                          ),
                          RoundedButton(colour:Colors.indigo,title: "S",onPressed:(){ /*parent2.marks1=parent2.marks1-5;*/
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent3(/*marks2: parent2.marks1,*/)));}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  color: Colors.teal,
                  child:Center(
                      child:Text(
                          "$_counter3",
                          style:TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Times New Roman",
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
