import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rate {
  String? poster_path;
  double? vote_average;
  Rate({
    this.poster_path,
    this.vote_average,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'poster_path': poster_path,
      'vote_average': vote_average,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      poster_path:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      vote_average:
          map['vote_average'] != null ? map['vote_average'] as double : null,
    );
  }
  String getPosterUrlRate() {
    return poster_path != null
        ? 'https://image.tmdb.org/t/p/w500$poster_path'
        : 'https://via.placeholder.com/500x750?text=No+Image';
  }

  String toJson() => json.encode(toMap());

  factory Rate.fromJson(String source) =>
      Rate.fromMap(json.decode(source) as Map<String, dynamic>);
}
