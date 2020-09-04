import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newgame/RoundedButton.dart';
import 'package:audioplayers/audio_cache.dart';
//import 'package:newgame/third_audio.dart';

class Parent5 extends StatefulWidget {
  Parent5({Key key/*,@required this.marks5*/}):super(key:key);
//int marks5;
  @override
  State<StatefulWidget> createState() {
    return Parent5State();
  }
}
class Parent5State extends State<Parent5> {
  int _counter5=7;
  Timer _timer5;
  //Parent5 parent5;

  void playsound() {
    final player = AudioCache();
    player.play('j.mp3');
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
                          _counter5=7;
                          if(_timer5 != null)
                          {
                            _timer5.cancel();
                          }
                          _timer5=Timer.periodic(Duration(seconds:1), (timer) {
                            setState(() {
                              if(_counter5>0){_counter5--;}
                              else
                              {
                                _timer5.cancel();
                                //Navigator.push(context,MaterialPageRoute(builder: (context) => second_audio()));
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
                            child: RoundedButton(colour:Colors.indigo,title: "J"/*,onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => second_audio()));}*/ ),
                          ),
                          RoundedButton(colour:Colors.deepPurple,title: "L"/*,onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => second_audio()));}*/),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right:40,left:40),
                            child: RoundedButton(colour:Colors.deepPurple,title: "X"/*,onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => second_audio()));}*/),
                          ),
                          RoundedButton(colour:Colors.indigo,title: "T"/*,onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => second_audio()));}*/),
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
                          "$_counter5",
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
