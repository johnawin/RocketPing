import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'ping.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Ping',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[900],

      ),
      home: MyHomePage(title: 'Rocket Ping'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rocket Ping', style: TextStyle(fontSize: 30, fontFamily: 'Quicksand'),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /*
            Image(image: AssetImage('images/rocket-2.png'),),
            Text('Ping', style: TextStyle(fontSize: 24, fontFamily: 'Quicksand'),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('Launch'),
                  onPressed: () {
                    setState(() {
                      pingResponseTime();
                    });
                  },
                ),
              ],
            ),
            */
            Text('Ping: $ping ms', style: TextStyle(fontFamily: 'Quicksand'),),
            Padding(padding: EdgeInsets.only(top: 150),),
            IconButton( onPressed: () {
                setState(() {
                  pingResponseTime();
                  ping = stopwatch.elapsedMicroseconds.toString();
                });
            }, iconSize: 128, icon: Image(image: AssetImage('images/rocket-2.png'),),),
            Text('Launch', style: TextStyle(fontFamily: 'Quicksand')),
            Padding(padding: EdgeInsets.only(bottom: 100),),
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
              selectedItemColor: Colors.red[900],
            ),
          ],
        ),
      ),
    );
  }
}
