import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Acting {
  String? known_for_department;
  String? name;
  String? profile_path;
  Acting({
    this.known_for_department,
    this.name,
    this.profile_path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'known_for_department': known_for_department,
      'name': name,
      'profile_path': profile_path,
    };
  }

  factory Acting.fromMap(Map<String, dynamic> map) {
    return Acting(
      known_for_department: map['known_for_department'] != null
          ? map['known_for_department'] as String
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      profile_path:
          map['profile_path'] != null ? map['profile_path'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Acting.fromJson(String source) =>
      Acting.fromMap(json.decode(source) as Map<String, dynamic>);
}
