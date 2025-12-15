import "dart:convert";

import "package:cinetopia/app/helpers/consts.dart";

class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String relaseData;
  final String overView;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.relaseData,
    required this.overView,
  });

  String getPosterImage() {
    return imageUrlPrefix + imageUrl;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'poster_path': imageUrl,
      'release_date': relaseData,
      'overview': overView,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      relaseData: map['release_date'] as String,
      overView: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
