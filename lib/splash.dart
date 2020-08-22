import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/variables.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getChildren() {
    children = List.generate(
      storyPages,
      (index) {
        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 30.0,
            runSpacing: 8.0,
            direction: Axis.horizontal,
            children: List.generate(
              int.parse(((storyLength - counter) / 6).toStringAsFixed(0)) > 0
                  ? 6
                  : ((storyLength - counter) % 6),
              (index) {
                if (counter == 0) {
                  counter++;
                  return Column(
                    children: [
                      ProfileStory(),
                      SizedBox(height: 10),
                      Text('My profile'),
                    ],
                  );
                } else {
                  counter++;
                  return Column(
                    children: [
                      OtherStories(),
                      SizedBox(height: 5),
                      Text('Profile $counter'),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getChildren();
    Timer(Duration(seconds: 2), () {
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
