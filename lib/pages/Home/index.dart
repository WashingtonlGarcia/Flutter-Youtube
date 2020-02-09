import 'package:flutter/material.dart';
import '../Inicio/index.dart';
import '../EmAlta/index.dart';
import '../Inscricoes/index.dart';
import '../Biblioteca/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indice = 0;
  @override
  List<Widget> pages = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        title: GestureDetector(
          onTap: () {
            setState(() {
              _indice = 0;
            });
          },
          child: Image.asset(
            "images/logo.png",
            width: 98,
            height: 22,
            alignment: Alignment.center,
          ),
        ),
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
      body: pages[_indice],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indice,
          onTap: (indice) {
            setState(() {
              _indice = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                title: Text("Inicio"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Em alta"), icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                title: Text("Inscrições"), icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                title: Text("Biblioteca"), icon: Icon(Icons.folder)),
          ]),
    );
  }
}
