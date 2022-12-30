import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'helperWidgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  dynamic pickedGender;
  double smokedDaily = 0.0;
  double sportWeekly = 0.0;

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
                Expanded(
                  child: ContainerWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text("Height", style: myStringStyle),
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text("180", style: myIntStyle),
                        ),
                        Column(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: ContainerWidget(child: Container())),
              ],
            ),
          ),
          Expanded(
              child: ContainerWidget(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How much time do you spend exercising per week?",
                  style: myStringStyle),
              SizedBox(height: 10),
              Text("${sportWeekly} Hours", style: myIntStyle),
              Slider(
                value: sportWeekly,
                min: 0,
                max: 20,
                onChanged: (double newValue) {
                  setState(() {
                    sportWeekly = newValue.roundToDouble();
                  });
                },
              )
            ],
          ))),
          Expanded(
              child: ContainerWidget(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How many cigarettes do you smoke per day?",
                  style: myStringStyle),
              SizedBox(height: 10),
              Text("${smokedDaily}", style: myIntStyle),
              Slider(
                value: smokedDaily,
                min: 0,
                max: 30,
                onChanged: (double newValue) {
                  setState(() {
                    smokedDaily = newValue.roundToDouble();
                  });
                },
              )
            ],
          ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pickedGender = "Woman";
                      setState(() {});
                    },
                    child: ContainerWidget(
                      color: (pickedGender == "Woman")
                          ? Colors.blue.shade300
                          : Colors.white70,
                      child: TextIconWidget(
                          gender: "Woman", icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pickedGender = "Man";
                      setState(() {});
                    },
                    child: ContainerWidget(
                      color: (pickedGender == "Man")
                          ? Colors.blue.shade300
                          : Colors.white70,
                      child: TextIconWidget(
                          gender: "Man", icon: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
