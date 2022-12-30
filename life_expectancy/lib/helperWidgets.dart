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
        Text(gender, style: myStringStyle)
      ],
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  ContainerWidget({this.color = Colors.white70, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}

final TextStyle myStringStyle =
    TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold);

final TextStyle myIntStyle =
    TextStyle(color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold);
