import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return StoryWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    Key key,
  }) : super(key: key);

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  double radius = 30.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          onLongPressStart: (details) {
            setState(() {
              radius = 25.0;
            });
          },
          onLongPressEnd: (details) {
            setState(() {
              radius = 30.0;
            });
          },
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StoryPage()));
          },
          child: Container(
            decoration: ShapeDecoration(shape: CircleBorder()),
            child: CircleAvatar(
              radius: radius,
              child: Icon(Icons.person),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pop(context);
    });
  }

  exit() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
