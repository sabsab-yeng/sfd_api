import 'package:flutter/material.dart';
import 'package:sfd_api/models/albums.dart';
import 'package:sfd_api/services/api_service.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Future<Albums> apiServivces;

  @override
  void initState() {
    super.initState();
    apiServivces = fectData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Api"),
      ),
      body: Center(
        child: FutureBuilder(
          future: fectData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data.title);
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(backgroundColor: Colors.pink,);
          },
        ),
      ),
    );
  }
}
