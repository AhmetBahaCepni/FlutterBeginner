import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "What should i eat today?",
            style:
                TextStyle(color: Colors.black, fontSize: 24, letterSpacing: 1),
          ),
        ),
        body: FoodPage(),
      ),
    );
  }
}

class FoodPage extends StatefulWidget {
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;
  int temp = 0;
  List<String> corbalistesi = [
    "Mercimek Çorbası",
    "Tarhana Çorbası",
    "Tavuk Çorbası",
    "Kremalı Mantar Çorbası",
    "Nohutlu Çorba"
  ];
  List<String> yemeklistesi = [
    "İmam Bayıldı",
    "Mantı",
    "Kuru Fasülye",
    "İçli Köfte",
    "Roka Balık"
  ];
  List<String> tatlilistesi = [
    "Kadayıf",
    "Baklava",
    "Fırın Sütlaç",
    "Köstebek Pasta",
    "Dondurma"
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  temp = corbaNo;
                  while (corbaNo == temp) {
                    corbaNo = Random().nextInt(5) + 1;
                  }
                });
              },
              child: Image(
                  image: AssetImage(
                "assets/corba_$corbaNo.jpg",
              )),
            ),
          )),
          Text(
            "${corbalistesi[corbaNo - 1]}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Container(width: 200, child: Divider(height: 5, color: Colors.black)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(1),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    temp = yemekNo;
                    while (yemekNo == temp) {
                      yemekNo = Random().nextInt(5) + 1;
                    }
                  });
                },
                child: Image.asset("assets/yemek_$yemekNo.jpg")),
          )),
          Text(
            "${yemeklistesi[yemekNo - 1]}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Container(width: 200, child: Divider(height: 5, color: Colors.black)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(1),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    temp = tatliNo;
                    while (tatliNo == temp) {
                      tatliNo = Random().nextInt(5) + 1;
                    }
                  });
                },
                child: Image.asset("assets/tatli_$tatliNo.jpg")),
          )),
          Text(
            "${tatlilistesi[tatliNo - 1]}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
