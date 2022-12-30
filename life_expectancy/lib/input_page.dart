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
  int height = 170;
  int weight = 60;
  int age = 18;
  int lifexpectancy = ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'LIFE EXPECTANCY = $lifexpectancy',
          style: TextStyle(
              color: Colors.black54,
              letterSpacing: 2.5,
              fontWeight: FontWeight.w700),
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
                          child: Text("Age", style: myStringStyle),
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text("$age", style: myIntStyle),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.plus),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  if (age > 15) age--;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                          child: Text("$height", style: myIntStyle),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  height++;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.plus),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  height--;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text("Weight", style: myStringStyle),
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text("$weight", style: myIntStyle),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  weight++;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.plus),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.blue, width: 0.5)),
                                onPressed: () {
                                  weight--;
                                  setState(() {});
                                },
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
