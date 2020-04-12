import 'package:flutter/material.dart';
import 'package:sfd_api/ui/albums/album_page.dart';
import 'package:sfd_api/ui/albums/albums_page.dart';

import 'albums/post_album_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SFDL Api"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(child: Text("Album"),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumPage()));
                },),
                SizedBox(height: 40,),
                 FlatButton(child: Text("Albums"),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumsPage()));
                },),
                SizedBox(height: 40,),
                 FlatButton(child: Text("Post Album"),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PostAlbumPage()));
                },),
                SizedBox(height: 40,),
                 FlatButton(child: Text("PUT"),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumPage()));
                },),
                SizedBox(height: 40,),
                 FlatButton(child: Text("Delete"),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumPage()));
                },),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
