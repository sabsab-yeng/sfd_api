import 'package:flutter/material.dart';
import 'package:sfd_api/models/albums.dart';
import 'package:sfd_api/services/api_service.dart';

class PutAlbumPage extends StatefulWidget {
  @override
  _PutAlbumPageState createState() => _PutAlbumPageState();
}

class _PutAlbumPageState extends State<PutAlbumPage> {
  final TextEditingController _controller = TextEditingController();
  Future<Albums> _futureUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Put/Update Album"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: (_futureUpdate == null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: "title"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      child: Text("Put/ Update"),
                      onPressed: () {
                        setState(() {
                          _futureUpdate = putedAlbum(_controller.text);
                        });
                      },
                    ),
                  ],
                )
              : FutureBuilder<Albums>(
                  future: _futureUpdate,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator(
                      backgroundColor: Colors.pink,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
