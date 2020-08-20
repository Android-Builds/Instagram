import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/widgets/storypage.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    Key key,
  }) : super(key: key);

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  double radius = 35.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        setState(() {
          radius = 30.0;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          radius = 35.0;
        });
      },
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StoryPage()));
      },
      child: CircleAvatar(
        radius: radius + 2.0,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}
