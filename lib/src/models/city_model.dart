import 'dart:convert';

class CityModel {
  final int id;
  final String name;

  CityModel({
    required this.id,
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
