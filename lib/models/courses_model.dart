import 'dart:convert';
import 'package:adf_cli/models/products_model.dart';

class CoursesModel extends ProductsModel {
  bool isStudent;

  CoursesModel({
    required this.isStudent,
    required super.id, 
    required super.name
    });

 

  
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isStudent': isStudent,
    };
  }

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      isStudent: map['isStudent'] as bool, 
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CoursesModel.fromJson(String source) => CoursesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
