import 'package:flutter/material.dart';

void main() => runApp(MyApp());
List<Color> pinned = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _pageOptions = [
    Page1(),
    Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens), label: "Main Page"),
          BottomNavigationBarItem(icon: Icon(Icons.colorize), label: "Widgets"),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (pinned.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 == pinned.length - 1)
          return Row(children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: pinned[index * 2],
            ),
          ]);
        else {
          return Row(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: pinned[index * 2],
              ),
              CircleAvatar(
                radius: 80,
                backgroundColor: pinned[index * 2 + 1],
              ),
            ],
          );
        }
      },
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  dynamic coloor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarWidget(
              my_color: Colors.orange,
              isPinned: pinned.contains(Colors.orange),
              mytext: isPinned(Colors.orange) ? "Pinned" : "Not Pinned",
            ),
            AvatarWidget(
              my_color: Colors.yellow,
              isPinned: pinned.contains(Colors.yellow),
              mytext: isPinned(Colors.yellow) ? "Pinned" : "Not Pinned",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarWidget(
              my_color: Colors.green,
              isPinned: pinned.contains(Colors.green),
              mytext: isPinned(Colors.green) ? "Pinned" : "Not Pinned",
            ),
            AvatarWidget(
              my_color: Colors.red,
              isPinned: pinned.contains(Colors.red),
              mytext: isPinned(Colors.red) ? "Pinned" : "Not Pinned",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarWidget(
              my_color: Colors.blue,
              isPinned: pinned.contains(Colors.blue),
              mytext: isPinned(Colors.blue) ? "Pinned" : "Not Pinned",
            ),
            AvatarWidget(
              my_color: Colors.purple,
              isPinned: pinned.contains(Colors.purple),
              mytext: isPinned(Colors.purple) ? "Pinned" : "Not Pinned",
            ),
          ],
        ),
      ],
    );
  }
}

bool isPinned(Color color) {
  if (pinned.contains(color))
    return true;
  else
    return false;
}

class AvatarWidget extends StatefulWidget {
  Color my_color;
  bool isPinned;
  String mytext;
  AvatarWidget(
      {required this.my_color, required this.isPinned, required this.mytext});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (widget.isPinned) {
            pinned.remove(widget.my_color);
            widget.mytext = "Not Pinned";
          } else if (pinned.length < 4) {
            pinned.add(widget.my_color);
            widget.mytext = "Pinned";
          }
        });
      },
      child: CircleAvatar(
        radius: 85,
        backgroundColor: widget.my_color,
        child: Text(widget.mytext),
      ),
    );
  }
}
