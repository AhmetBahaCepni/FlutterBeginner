import 'package:flutter/material.dart';
import 'package:quiz/test_veri.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Icon(Icons.thumb_down, size: 30.0),
                          onPressed: () {
                            setState(() {
                              if (test_1.isValid()) {
                                if (test_1.getSoruYaniti() == false) {
                                  secimler.add(correctIcon);
                                } else {
                                  secimler.add(uncorrectIcon);
                                }
                              }
                            });
                          },
                        ))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[400],
                        padding: EdgeInsets.all(12),
                      ),
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        setState(() {
                          if (test_1.isValid()) {
                            if (test_1.getSoruYaniti() == true) {
                              secimler.add(correctIcon);
                            } else {
                              secimler.add(uncorrectIcon);
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
              ])),
        ),
      ],
    );
  }
}
