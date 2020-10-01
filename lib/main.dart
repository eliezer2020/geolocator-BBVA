import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'about_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          "about": (context) => About(),
        });
  }
}

TextStyle customText = TextStyle(fontSize: 18);
final positionWidget = StreamBuilder<Position>(
    stream: getPositionStream(),
    initialData: null,
    builder: (context, AsyncSnapshot<Position> snapshot) {
      if (snapshot.hasError || snapshot.data == null) {
        return Center(
            child: Text(
          "please verify the connection...",
          style: customText,
        ));
      } else {
        return Center(
          child: Text(
            snapshot.data.latitude.toString() +
                ', ' +
                snapshot.data.longitude.toString(),
            style: customText,
          ),
        );
      }
    });

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geolocator BBVA"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, "about");
            }),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "My position: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            positionWidget,
          ],
        ),
      ),
    );
  }
}
