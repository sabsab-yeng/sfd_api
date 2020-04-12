import 'package:flutter/material.dart';
import 'package:sfd_api/models/albums.dart';
import 'package:sfd_api/services/api_service.dart';
import 'package:sfd_api/widgets/button_widget.dart';

class PostAlbumPage extends StatefulWidget {
  @override
  _PostAlbumPageState createState() => _PostAlbumPageState();
}

class _PostAlbumPageState extends State<PostAlbumPage> {
  final TextEditingController _controller = TextEditingController();

  Future<Albums> _futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post/Insert Albums"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: (_futureAlbum == null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'title'),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                      title: "Post new Data",
                      onPressed: () {
                        setState(() {
                          _futureAlbum = insertAlbum(_controller.text);
                        });
                      },
                    ),
                  ],
                )
              : FutureBuilder<Albums>(
                  future: _futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
