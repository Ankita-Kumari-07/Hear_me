import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newgame/RoundedButton.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:newgame/Parent5.dart';

class Parent4 extends StatefulWidget {
  Parent4({Key key/*,@required this .marks4*/}):super(key:key);
//int marks4;
  @override
  State<StatefulWidget> createState() {
    return Parent4State();
  }
}
class Parent4State extends State<Parent4> {
  int _counter4=7;
  Timer _timer4;
//Parent4 parent4;
  void playsound() {
    final player = AudioCache();
    player.play('y.mp3');
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
                          _counter4=7;
                          if(_timer4 != null)
                          {
                            _timer4.cancel();
                          }
                          _timer4=Timer.periodic(Duration(seconds:1), (timer) {
                            setState(() {
                              if(_counter4>0){_counter4--;}
                              else
                              {
                                _timer4.cancel();
                                //parent4.marks4=parent4.marks4+0;
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Parent5(/*marks5:parent4.marks4*/ )));
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
                            child: RoundedButton(colour:Colors.indigo,title: "G",onPressed:(){
                              //parent4.marks4=parent4.marks4-5;
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Parent5(/*marks5:parent4.marks4*/ )));} ),
                          ),
                          RoundedButton(colour:Colors.deepPurple,title: "T",onPressed:(){
                            //parent4.marks4=parent4.marks4-5;
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent5(/*marks5:parent4.marks4*/ )));}),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right:40,left:40),
                            child: RoundedButton(colour:Colors.deepPurple,title: "C",onPressed:(){
                              //parent4.marks4=parent4.marks4-5;
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Parent5(/*marks5:parent4.marks4 */)));}),
                          ),
                          RoundedButton(colour:Colors.indigo,title: "Y",onPressed:(){
                            //parent4.marks4=parent4.marks4+10;
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Parent5(/*marks5:parent4.marks4*/ )));}),
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
                          "$_counter4",
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
