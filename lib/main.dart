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
      title: 'Instagram',
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.grey[900],
        ),
        appBarTheme: AppBarTheme(color: Colors.grey[900]),
        popupMenuTheme: PopupMenuThemeData(color: Colors.black),
        dialogBackgroundColor: Colors.black,
      ),
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
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Messages())))
        ],
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
                    if (index == 0)
                      return ProfileStory();
                    else
                      return OtherStories();
                  }),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
            )
          ],
        ),
      ),
    );
  }
}

int accountCount = 1;

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('username'),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: accountCount + 1,
                              itemBuilder: (context, index) {
                                if (index == accountCount)
                                  return ListTile(
                                    title: Text('Add Account'),
                                  );
                                else
                                  return ListTile(
                                    leading: Icon(
                                      Icons.account_circle,
                                      size: 20.0,
                                    ),
                                    title: Text('account1'),
                                  );
                              })
                        ],
                      );
                    });
              },
            )
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: null),
          IconButton(icon: Icon(Icons.note_add), onPressed: null),
        ],
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
    return GestureDetector(
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
          backgroundColor: Colors.white,
          radius: radius,
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}

class OtherStories extends StatelessWidget {
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
        child: StoryWidget(),
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

class ProfileStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Stack(
          children: [
            StoryWidget(),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  radius: 9.0,
                  child: Icon(
                    Icons.add,
                    size: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
