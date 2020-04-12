import 'package:flutter/material.dart';
import 'package:sfd_api/models/albums.dart';
import 'package:sfd_api/services/api_service.dart';
import 'package:sfd_api/ui/albums/album_detail.dart';

class AlbumsPage extends StatefulWidget {
  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<Albums>> apiServivces;

  @override
  void initState() {
    super.initState();
    apiServivces = fectAllAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums ListView"),
      ),
      body: Center(
        child: FutureBuilder(
          future: fectAllAlbums(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Albums> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].title),
                      leading: CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailPage(
                              title: data[index].title,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.pink,
            );
          },
        ),
      ),
    );
  }
}
