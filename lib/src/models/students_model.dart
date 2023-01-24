import 'dart:convert';
import 'package:adf_cli/src/models/address_model.dart';
import 'package:adf_cli/src/models/course_model.dart';

class StudentsModel {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<CourseModel> courses;
  final AddressModel address;

  StudentsModel(
      {this.id,
      required this.name,
      this.age,
      required this.nameCourses,
      required this.courses,
      required this.address});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

   String toJson() => json.encode(toMap());

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        age: map['age'] ?? '',
        nameCourses: List<String>.from((map['nameCourses'] ?? <String>[])),
        address: AddressModel.fromMap(map['address'] ?? <String, dynamic>{}),
        courses: map['courses'] 
                ?.map<CourseModel>((coursesMap) => CourseModel.fromMap(coursesMap))
                .toList() ??  <CourseModel>[],
        );
  }

 

  factory StudentsModel.fromJson(String json) => StudentsModel.fromMap(jsonDecode(json));
}
