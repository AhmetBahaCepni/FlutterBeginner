import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey[800],
      centerTitle: true,
      title: Text('deneme'),
    ),
    body: Image(
      image: AssetImage("images/lol.png"),
    ),
  )));
}
