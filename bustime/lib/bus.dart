import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import 'const.dart';
import 'tablepage.dart';

void main() => runApp(FlutterApp());

Future<void> _fetchHTMLContent(int busIndex) async {
  /// bu fonksiyon günde bi kere yapılması gereken fonksiyon ben şuanlık hangi otobüsün sayfasına tıkladıysam onun saatlerini çekiyor
  ///   ama bunu her otobüs için günde 1 kere yapıp depolamalıyız

  dynamic tableSize;
  dynamic stringElement;

  final response = await http.get(Uri.parse(busLinks[busIndex]));
  final document = parser.parse(response.body);
  tableSize = document
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
  for (int i = 0; (i + 1).toString() != tableSize.replaceAll("\"", ""); i++) {
    stringElement = document
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
    if (stringElement == null) break;
    busTables[busIndex][0].add(stringElement);
  }
  tableSize = document
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
  for (int i = 0; (i + 1).toString() != tableSize.replaceAll("\"", ""); i++) {
    stringElement = document
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

    busTables[busIndex][1].add(stringElement);
  }
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < busNums.length; i++) {
      _fetchHTMLContent(i);
    }
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 0.75,
          ),
          itemCount: busNums.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TablePage(
                        busIndex: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        busNums[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 1,
                        ),
                      ),
                      Container(
                        child: Text(
                          busNames[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        "X Min",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1, 2),
                          blurRadius: 6.0)
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade300,
                        Colors.deepPurple.shade300
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25), //boy*0.28
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
