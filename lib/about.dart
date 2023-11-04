import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text("This is simple Calculator app. This app is free for everyone. You can easily do any calculation with this calculator.",
              style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
