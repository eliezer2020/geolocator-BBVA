import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autor"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Esta App fue creada para fines educativos en flutter por: Gerson Morales"),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(),
          _lanzarUrl(),
          Divider(),
          Text(" Tecnologias:"),
          FlutterLogo(),
          Text("Packages: \n geolocator: ^6.0.0+4 \n  url_launcher: ^5.4.10"),
        ],
      ),
    );
  }

  Widget _lanzarUrl() {
    return Center(
        child: new RaisedButton(
            onPressed: _launchURL, child: new Text('react.gersonmorales.com')));
  }

  _launchURL() async {
    const url = 'http://react.gersonmorales.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
