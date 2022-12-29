import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextIconWidget extends StatelessWidget {
  final String gender;
  final IconData icon;
  TextIconWidget({this.gender = "None", this.icon = FontAwesomeIcons.cross});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(height: 15),
        Text(
          gender,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ExpandedContainerWidget extends StatelessWidget {
  final Color renk;
  final Widget child;
  ExpandedContainerWidget({this.renk = Colors.white, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
      ),
    );
  }
}
