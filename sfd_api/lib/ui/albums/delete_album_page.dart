import 'package:flutter/material.dart';
import 'package:sfd_api/models/albums.dart';
import 'package:sfd_api/services/api_service.dart';
import 'package:sfd_api/widgets/button_widget.dart';

class DeleteAlbumPage extends StatefulWidget {
  @override
  _DeleteAlbumPageState createState() => _DeleteAlbumPageState();
}

class _DeleteAlbumPageState extends State<DeleteAlbumPage> {
  Future<Albums> _futureDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Album"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: (_futureDelete == null)
                ? ButtonWidget(
                  title: "Delete",
                    onPressed: () {
                      setState(() {
                        _futureDelete = deleteAlbum();
                      });
                    },
                  )
                : FutureBuilder(
                    future: _futureDelete,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Text("Success");
                      }
                      return CircularProgressIndicator(
                        backgroundColor: Colors.pinkAccent,
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
