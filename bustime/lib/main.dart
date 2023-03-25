import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _fetchHTMLContent();
  }

  List<String> _times = [];
  List<String> _times1 = [];
  dynamic h1Element = "asd";
  dynamic size = "0";

  Future<void> _fetchHTMLContent() async {
    final response = await http.get(Uri.parse(
        'https://www.kocaeli.bel.tr/tr/main/hatlar/490E/muallimkoy-kyk-yurdu-gebze-teknik-universites-otobus-sefer-saatleri-ve-duraklari')); //add comment later
    final document = parser.parse(response.body);
    size = document
        .getElementsByClassName("tab-pane fade in active")[0]
        .children[0]
        .children[1]
        .children[1]
        .children[1]
        .querySelector("tr:last-child")
        ?.children[0]
        .children[0]
        .firstChild
        .toString();
    for (int i = 0; (i + 1).toString() != size.replaceAll("\"", ""); i++) {
      h1Element = document
          .getElementsByClassName("tab-pane fade in active")[0]
          .children[0]
          .children[1]
          .children[1]
          .children[1]
          .children[i] // 0, 1, 2, to get to the next
          .children[1]
          .children[0]
          .firstChild
          .toString();
      if (h1Element == null) break;
      _times.add(h1Element);
    }
    size = document
        .getElementsByClassName("tab-pane fade in active")[0]
        .children[0]
        .children[2]
        .children[1]
        .children[1]
        .querySelector("tr:last-child")
        ?.children[0]
        .children[0]
        .firstChild
        .toString();
    for (int i = 0; (i + 1).toString() != size.replaceAll("\"", ""); i++) {
      h1Element = document
          .getElementsByClassName("tab-pane fade in active")[0]
          .children[0]
          .children[2]
          .children[1]
          .children[1]
          .children[i] // 0, 1, 2, to get to the next
          .children[1]
          .children[0]
          .firstChild
          .toString();

      _times1.add(h1Element);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, right: 6, left: 6, bottom: 8),
              width: 360,
              height: 125,
              decoration: BoxDecoration(
                color: Color(0xFF00609c),
                borderRadius: BorderRadiusDirectional.circular(20.0),
              ),
              child: Text(
                  'Gebze Teknik Üniversitesi-Fatih durağından kalkmasına \$(nextbus - currenttime) dakika kaldı',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),

              //color: Colors.white,
              alignment: Alignment.center,
            ),
            //SizedBox(
            // height: 10,
            //),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFbe1238),
                    borderRadius: BorderRadiusDirectional.circular(15.0),
                  ),
                  child: Text('\$(from1) ----> \$(to1)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center),
                  //color: Colors.white,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFbe1238),
                    borderRadius: BorderRadiusDirectional.circular(15.0),
                  ),
                  child: Text('\$(from2) ----> \$(to2)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center),
                  //color: Colors.white,
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(
              height: 10.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  width: 160,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF3E0),
                      borderRadius: BorderRadiusDirectional.circular(20.0)),
                  child: ListView(
                    itemExtent: 35,
                    children: _times.map((item) {
                      return ListTile(
                        title: Text(
                          item.replaceAll("\"", ""),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    }).toList(),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  width: 160,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF3E0),
                      borderRadius: BorderRadiusDirectional.circular(20.0)),
                  child: ListView(
                    itemExtent: 35,
                    children: _times1.map((item) {
                      return ListTile(
                        title: Text(
                          item.replaceAll("\"", ""),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    }).toList(),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
