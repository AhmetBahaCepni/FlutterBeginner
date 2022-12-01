import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage('assets/kahve.jpg'),
              ),
              Text(
                "Flutter Kahvecisi",
                style: TextStyle(
                  fontFamily: "Satisfy",
                  fontSize: 45,
                  color: Colors.brown[700],
                ),
              ),
              Text(
                "BİR FİNCAN UZAĞINIZDA",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 25),
                  width: 250,
                  child: Divider(
                    height: 3,
                    color: Colors.brown[900],
                  )),
              Transform(
                // Rotation widget
                transform: Matrix4.rotationZ(-0.03), // To give rotation
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 45.0),
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text("sipariş@ftt_kahvecisi.com",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Transform(
                transform: Matrix4.rotationZ(0.03), // for rotation
                child: Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      "0 555 555 55 55",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
