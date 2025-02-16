import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  String? name;
  String? key;
  String? published_at;
  Video({this.name, this.key, this.published_at});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'key': key,
      'published_at': published_at,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      name: map['name'] != null ? map['name'] as String : null,
      key: map['key'] != null ? map['key'] as String : null,
      published_at: map['published_at']?.substring(0, 10),
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
