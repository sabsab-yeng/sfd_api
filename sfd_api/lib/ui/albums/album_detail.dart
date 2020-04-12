import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {
  final String title;

  AlbumDetailPage({this.title});

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Album"),
      ),
      body: SingleChildScrollView(
              child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
              child: Text(
            widget.title,
            style: TextStyle(color: Colors.pink, fontSize: 100),
          )),
        ),
      ),
    );
  }
}
