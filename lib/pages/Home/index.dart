import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        title:GestureDetector(
          onTap: (){print("Youtube");},
          child: Image.asset("images/logo.png",width: 98,height: 22,alignment: Alignment.center,),) 
          ,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              print("Video call");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("search");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("account circle");
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
