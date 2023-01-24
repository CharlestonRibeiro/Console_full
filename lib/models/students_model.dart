import 'dart:convert';
import 'package:adf_cli/models/courses_model.dart';
import 'package:adf_cli/models/products_model.dart';

class StudentsModel {
  int id;
  String name;
  int age;
  ProductsModel nameCourses;
  CoursesModel courses;

  StudentsModel({
    required this.id,
    required this.name,
    required this.age,
    required this.nameCourses,
    required this.courses
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses.toMap(),
      'courses': courses.toMap(),
    };
  }

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      nameCourses: ProductsModel.fromMap(map['nameCourses'] as Map<String,dynamic>),
      courses: CoursesModel.fromMap(map['courses'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentsModel.fromJson(String source) => StudentsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
