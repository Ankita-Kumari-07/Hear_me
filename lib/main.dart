import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:newgame/RoundedButton.dart';
import 'package:newgame/Parent2.dart';

void main() => runApp(Parent());
class Parent extends StatefulWidget {

Parent({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }
}
class ParentState extends State<Parent> {
  int _counter=7;
  Timer _timer;
   //int marks=0;
 void playsound() {
   final player = AudioCache();
    player.play('b.mp3');
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
                          _counter=7;
                          if(_timer != null)
                            {
                              _timer.cancel();
                            }
                          _timer=Timer.periodic(Duration(seconds:1), (timer) {
                            setState(() {
                              if(_counter>0){_counter--;}
                              else
                                {
                                  _timer.cancel();

                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Parent2(/*marks1: marks+0*/)));
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
                            child: RoundedButton(colour:Colors.indigo,title: "A",onPressed:(){ /*marks=marks-5;*/
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent2(/*marks1: marks*/)));} ),
                          ),
                          RoundedButton(colour:Colors.deepPurple,title: "B",onPressed:(){ /*marks=marks+10;*/
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Parent2(/*marks1: marks*/)));}),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right:40,left:40),
                            child: RoundedButton(colour:Colors.deepPurple,title: "C",onPressed:(){
                              /*marks=marks-5;*/
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Parent2(/*marks1:marks*/)));}),
                          ),
                          RoundedButton(colour:Colors.indigo,title: "D",onPressed:(){
                          /*  marks=marks-5; */
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent2(/*marks1: marks*/)));}),
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
                          "$_counter",
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



  



