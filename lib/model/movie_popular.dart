import 'dart:convert';

import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/video.dart';

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
  10765: "Sci-Fi & Fantasy",
  10762: "Kids",
  10759: "Action & Adventure",
  878: "Science Fiction",
  10766: "Soap Opera",
  53: "Thriller",
  10767: "Talk Show",
  10752: "War",
  10764: "Reality",
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MoviePopular {
  String? title;
  String? poster_path;
  List<int>? genre_ids;
  double? vote_average;
  String? overview;
  int? release_date;
  int? first_air_date;
  String? original_language;
  int? id;
  List<Video>? videos;
  String? name;
  List<Genre>? genres;
  MoviePopular({
    this.title,
    this.poster_path,
    this.genre_ids,
    this.vote_average,
    this.overview,
    this.release_date,
    this.first_air_date,
    this.original_language,
    this.id,
    this.videos = const [],
    this.name,
    this.genres = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'poster_path': poster_path,
      'genre_ids': genre_ids,
      'vote_average': vote_average,
      'overview': overview,
      'release_date': release_date,
      'first_air_date': first_air_date,
      'original_language': original_language,
      'id': id,
      'videos': videos?.map((e) => e.toMap()).toList(),
      'genres': genres?.map((e) => e.toMap()).toList(),
      'name': name,
    };
  }

  factory MoviePopular.fromMap(Map<String, dynamic> map) {
    return MoviePopular(
      title: map['title'] as String?,
      name: map['name'] as String?,
      poster_path: map['poster_path'] as String?,
      genre_ids: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'].map((e) => e as int))
          : [],
      vote_average:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      release_date: map['release_date'] != null
          ? DateTime.tryParse(map['release_date'] as String)?.year
          : null,
      first_air_date: map['first_air_date'] != null
          ? DateTime.tryParse(map['first_air_date'] as String)?.year
          : null,
      original_language: map['original_language'] as String?,
      id: map['id'] as int?,
      videos: map['videos'] != null
          ? List<Video>.from(
              map['videos'].map((videoJson) => Video.fromMap(videoJson)),
            )
          : [],
      genres: map['genres'] != null
          ? List<Genre>.from(
              map['genres'].map((videoJson) => Genre.fromMap(videoJson)),
            )
          : [],
    );
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

  factory MoviePopular.fromJson(String source) =>
      MoviePopular.fromMap(json.decode(source) as Map<String, dynamic>);
}
