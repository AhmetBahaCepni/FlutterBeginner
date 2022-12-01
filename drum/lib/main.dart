import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "DRUM",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 30,
                fontSize: 25),
          ),
          backgroundColor: Colors.teal,
        ),
        body: DrumPage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final oynatici = AudioCache();
  playAudio(ses) {
    oynatici.play("$ses.wav");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("bongo", Colors.blueAccent),
                  ),
                  Expanded(
                    child: buildDrumPad("bip", Colors.redAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("clap1", Colors.yellowAccent),
                  ),
                  Expanded(
                    child: buildDrumPad("clap2", Colors.purple),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("clap3", Colors.deepOrange),
                  ),
                  Expanded(
                    child: buildDrumPad("crash", Colors.brown),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("oobah", Colors.green),
                  ),
                  Expanded(
                    child: buildDrumPad("woo", Colors.pinkAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildDrumPad(myaudio, mycolor) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(2)),
      onPressed: () {
        playAudio(myaudio);
      },
      child: Container(
        color: mycolor,
      ),
    );
  }
}
