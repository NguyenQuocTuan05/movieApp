import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class Rate {
  String? title;
  String? poster_path;
  List<int>? genre_ids;
  double? vote_average;
  String? overview;
  int? release_date;
  String? original_language;
  int? id;
  Rate({
    this.poster_path,
    this.vote_average,
    this.id,
    this.title,
    this.genre_ids,
    this.overview,
    this.release_date,
    this.original_language,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'poster_path': poster_path,
      'vote_average': vote_average,
      'id': id,
      'title': title,
      'genre_ids': genre_ids,
      'overview': overview,
      'release_date': release_date,
      'original_language': original_language,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      poster_path:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      vote_average:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      genre_ids: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'].map((e) => e as int))
          : [],
      overview: map['overview'] != null ? map['overview'] as String : null,
      release_date: map['release_date'] != null
          ? DateTime.parse(map['release_date'] as String).year
          : null,
      original_language: map['original_language'] != null
          ? map['original_language'] as String
          : null,
    );
  }

  String getOriginalLanguageFull() {
    if (original_language != null &&
        languageMap.containsKey(original_language)) {
      return languageMap[original_language] ?? 'Unknown Language';
    }
    return 'Unknown Language';
  }

  String getGenresAsString() {
    if (genre_ids != null && genre_ids!.isNotEmpty) {
      return genre_ids!.map((id) => genreMap[id] ?? 'Unknown Genre').join(', ');
    }
    return 'No Genres Available';
  }

  String toJson() => json.encode(toMap());

  factory Rate.fromJson(String source) =>
      Rate.fromMap(json.decode(source) as Map<String, dynamic>);
}
