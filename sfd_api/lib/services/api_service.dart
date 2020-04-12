import 'package:http/http.dart' as http;
import 'package:sfd_api/models/albums.dart';
import 'dart:convert';
import 'dart:async';

final url = "https://jsonplaceholder.typicode.com/albums";

Future<Albums> fectData() async {
  // return http.get('https://jsonplaceholder.typicode.com/albums/1');

  final response = await http.get(url + '/1');

  if (response.statusCode == 200) {
    //if ther server did return a 200 Ok reponse
    // then parse the Json
    return Albums.fromJson(json.decode(response.body));
  } else {
    //if the server did not return a 200 Ok respone
    //then throw an excetion
    throw Exception('Fail to load data in album');
  }
}

Future<List<Albums>> fectAllAlbums() async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((album) => Albums.fromJson(album)).toList();
  } else {
    throw Exception('Fail to load data in album');
  }
}

Future<Albums> insertAlbum(String title) async {
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    //if the server did return a 201 Posted response
    //  the parse the json
    return Albums.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
