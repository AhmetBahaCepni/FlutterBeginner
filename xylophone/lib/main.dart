import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          title: Text(
            "Xylophopne",
            style: TextStyle(
                fontFamily: "KaushanScript",
                letterSpacing: 3,
                fontSize: 28,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white30,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note1.wav");
                },
                child: Container(
                  color: Colors.red,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note2.wav");
                },
                child: Container(
                  color: Colors.orange,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note3.wav");
                },
                child: Container(
                  color: Colors.yellow,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note4.wav");
                },
                child: Container(
                  color: Colors.green,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note5.wav");
                },
                child: Container(
                  color: Colors.teal,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note6.wav");
                },
                child: Container(
                  color: Colors.blue,
                  height: 75,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 1.5)),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note7.wav");
                },
                child: Container(
                  color: Colors.purple,
                  height: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
