import 'dart:convert';
import 'package:adf_cli/src/models/course_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<CourseModel> findByName(String name) async {
    var url = Uri.parse('http://192.168.2.6:8081/products?name=$name');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('Produto não encontrado');
    }

    return CourseModel.fromMap(responseData.first);
  }
}
