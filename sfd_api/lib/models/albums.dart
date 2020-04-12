class Albums {
  final int userId;
  final int id;
  final String title;

  Albums({this.id, this.title, this.userId});

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
