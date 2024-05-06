import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  int id;
  String name;
  String slug;
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
