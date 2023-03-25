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

  dynamic h1Element = "asd";
  dynamic size = "0";
  Future<void> _fetchHTMLContent() async {
    final response = await http.get(Uri.parse(
        'https://www.kocaeli.bel.tr/tr/main/hatlar/490E/muallimkoy-kyk-yurdu-gebze-teknik-universites-otobus-sefer-saatleri-ve-duraklari'));
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
      setState(() {
        _times.add(h1Element);
      });
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
      setState(() {
        _times1.add(h1Element);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTML to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTML to Flutter'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 400,
                height: 600,
                child: ListView(
                  children: _times.map((item) {
                    return ListTile(
                      title: Text(item),
                    );
                  }).toList(),
                ),
                color: Colors.orange,
              ),
              Container(
                width: 400,
                height: 600,
                child: ListView(
                  children: _times1.map((item) {
                    return ListTile(
                      title: Text(item),
                    );
                  }).toList(),
                ),
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
