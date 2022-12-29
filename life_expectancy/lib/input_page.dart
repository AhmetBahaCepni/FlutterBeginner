import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'helperWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIFE EXPECTANCY',
          style: TextStyle(color: Colors.black54, letterSpacing: 2.5),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                ExpandedContainerWidget(child: Container()),
                ExpandedContainerWidget(child: Container()),
              ],
            ),
          ),
          ExpandedContainerWidget(child: Container()),
          ExpandedContainerWidget(child: Container()),
          Expanded(
            child: Row(
              children: [
                ExpandedContainerWidget(
                  child: TextIconWidget(
                      gender: "Woman", icon: FontAwesomeIcons.venus),
                ),
                ExpandedContainerWidget(
                  child: TextIconWidget(
                      gender: "Man", icon: FontAwesomeIcons.mars),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
