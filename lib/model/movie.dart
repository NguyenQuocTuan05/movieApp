// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

Map<int, String> genreMap = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  53: "Thriller",
  10752: "War",
  37: "Western",
  10770: "TV Movie",
};
Map<String, String> languageMap = {
  'en': 'English',
  'es': 'Spanish',
  'fr': 'French',
  'de': 'German',
  'it': 'Italian',
  'ja': 'Japanese',
  'ko': 'Korean',
  'zh': 'Chinese',
  'nl': 'Netherlands',
  'hi': 'India',
  'lv': 'Latvian',
  'pt': 'Portuguese',
  'ro': 'Romania'
};

class Movie {
  String? title;
  String? poster_path;
  List<int>? genre_ids;
  double? vote_average;
  String? overview;
  int? release_date;
  String? original_language;
  int? id;
  Movie({
    this.title,
    this.poster_path,
    this.genre_ids,
    this.vote_average,
    this.overview,
    this.release_date,
    this.original_language,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'poster_path': poster_path,
      'genre_ids': genre_ids,
      'vote_average': vote_average,
      'overview': overview,
      'release_date': release_date,
      'original_language': original_language,
      'id': id,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String?,
      poster_path: map['poster_path'] as String?,
      genre_ids: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'].map((e) => e as int))
          : [],
      vote_average:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      release_date: (map['release_date'] != null &&
              map['release_date'].toString().isNotEmpty)
          ? int.tryParse(map['release_date'].toString().split('-')[0])
          : null,
      original_language: map['original_language'] as String?,
      id: map['id'] as int?,
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

  String getOriginalLanguageFull() {
    if (original_language != null &&
        languageMap.containsKey(original_language)) {
      return languageMap[original_language] ?? 'Unknown Language';
    }
    return 'Unknown Language';
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
