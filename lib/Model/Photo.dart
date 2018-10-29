class Photo {
  final int albumId;
  final int id;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
