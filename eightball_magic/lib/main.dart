import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade700,
          centerTitle: true,
          title: const Text(
            'Magic 8-Ball',
            style: TextStyle(
              letterSpacing: 2.5,
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
        body: MainPage(),
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int num = Random().nextInt(5) + 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 100, 0, 0),
      child: TextButton(
        onPressed: (){
          setState(() {
            num = Random().nextInt(5) + 1;
          });
        },
        child: Image(
          image: AssetImage("images/ball$num.png"),
          height: 350,
          width: 350,
        ),
      ),
    );
  }
}
