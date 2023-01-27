import 'dart:io';
import 'package:adf_cli/src/models/address_model.dart';
import 'package:adf_cli/src/models/city_model.dart';
import 'package:adf_cli/src/models/phone_model.dart';
import 'package:adf_cli/src/models/students_model.dart';
import 'package:adf_cli/src/repositories/product_repository.dart';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class InsertCommand extends Command {
  final StudentRepository studentRepository;

  InsertCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the cvs file', abbr: 'f');
  }

  final productRepository = ProductRepository();

  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    print('Aguarde...');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('----------------------------------------');

    for (var student in students) {
      final studentData = student.split(';');
      final courseCvs = studentData[2].split(',').map((e) => e.trim()).toList();

      final cousesFutures = courseCvs.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(cousesFutures);

      final studentsModel = StudentsModel(
          name: studentData[0],
          age: int.tryParse(studentData[1]),
          nameCourses: courseCvs,
          courses: courses,
          address: AddressModel(
              street: studentData[3],
              number: int.parse(studentData[4]),
              zipCode: studentData[5],
              city: CityModel(id: 1, name: studentData[6]),
              phone: PhoneModel(
                  ddd: int.parse(studentData[7]), phone: studentData[8])));

      await studentRepository.insert(studentsModel);
      
    }
    print('----------------------------------------');
    print('Alunos adicionados com sucesso');
  }
}
