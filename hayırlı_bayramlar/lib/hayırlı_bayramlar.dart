import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[300], // Color(0xff+HEX_CODE) works too
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
          title: Text("Mutlu Bayramlar"),
        ),
        body: Center(child: Image.asset("images/bayram_sekeri.jpg")),
      ),
    ),
  );
}
