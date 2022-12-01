import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_icons.dart';

void main() {
  return runApp(
0    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dicey',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 6,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.teal[800],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var num_l = Random().nextInt(6) + 1;
  var num_r = Random().nextInt(6) + 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  num_l = Random().nextInt(6) + 1;
                });
              },
              child: Image(
                color: Colors.black54,
                image: AssetImage("assets/images/dice$num_l.png"),
                height: 150,
                width: 150,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  num_r = Random().nextInt(6) + 1;
                });
              },
              child: Image(
                color: Colors.black54,
                image: AssetImage("assets/images/dice$num_r.png"),
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        FloatingActionButton.extended(
          extendedPadding: EdgeInsets.symmetric(horizontal: 25),
          backgroundColor: Colors.teal[800],
          onPressed: () {
            setState(() {
              num_l = Random().nextInt(6) + 1;
              num_r = Random().nextInt(6) + 1;
            });
          },
          label: Text(
            '   Roll BOTH!',
            style:
                TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
          ),
          icon: Icon(
            MyFlutterApp.dice,
            color: Colors.grey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
