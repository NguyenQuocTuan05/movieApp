// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

const Map<int, String> genreMap = {
  28: "Action",
  878: "Science Fiction",
  12: "Adventure",
  53: "Thriller",
  14: "Fantasy",
  35: "Comedy",
  16: "Animation",
  10751: "Family",
};

class Movie {
  String? original_title;
  String? poster_path;
  List<int>? genre_ids;
  double? vote_average;
  Movie({
    this.original_title,
    this.poster_path,
    this.genre_ids,
    this.vote_average,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'original_title': original_title,
      'poster_path': poster_path,
      'genre_ids': genre_ids,
      'vote_average': vote_average,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      original_title: map['original_title'] as String?,
      poster_path: map['poster_path'] as String?,
      genre_ids: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'].map((e) => e as int))
          : [],
      vote_average:
          map['vote_average'] != null ? map['vote_average'] as double : null,
    );
  }

  String getPosterUrl() {
    return poster_path != null
        ? 'https://image.tmdb.org/t/p/w200$poster_path'
        : 'https://via.placeholder.com/500x750?text=No+Image';
  }

  String getGenresAsString() {
    if (genre_ids != null && genre_ids!.isNotEmpty) {
      return genre_ids!.map((id) => genreMap[id] ?? 'Unknown Genre').join(', ');
    }
    return 'No Genres Available';
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
