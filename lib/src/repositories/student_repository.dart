import 'dart:convert';
import 'package:adf_cli/src/models/students_model.dart';
import 'package:http/http.dart' as http;

class StudentRepository {
  Future<List<StudentsModel>> findAll() async {
    var url = Uri.parse('http://192.168.2.6:8081/students');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final result = jsonDecode(response.body);

    return result.map<StudentsModel>((student) {
      return StudentsModel.fromMap(student);
    }).toList();
  }

  Future<StudentsModel> findById(int id) async {
    var url = Uri.parse('http://192.168.2.6:8081/students/$id');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    if (response.body == '{}') {
      throw Exception();
    }

    final StudentsModel result = StudentsModel.fromJson(response.body);

    return result;
  }

  Future<void> insert(StudentsModel studentsModel) async {
    var url = Uri.parse('http://192.168.2.6:8081/students/');
    final response =
        await http.post(url, body: studentsModel.toJson(), headers: {
      'content-type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(StudentsModel studentsModel) async {
    var url = Uri.parse('http://192.168.2.6:8081/students/${studentsModel.id}');
    final response =
        await http.put(url, body: studentsModel.toJson(), headers: {
      'content-type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    var url = Uri.parse('http://192.168.2.6:8081/students/$id');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
