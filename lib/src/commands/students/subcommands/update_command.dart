import 'dart:io';
import 'package:adf_cli/src/models/address_model.dart';
import 'package:adf_cli/src/models/city_model.dart';
import 'package:adf_cli/src/models/phone_model.dart';
import 'package:adf_cli/src/models/students_model.dart';
import 'package:adf_cli/src/repositories/product_repository.dart';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class UpdateCommand extends Command {
  final StudentRepository studentRepository;
  UpdateCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the cvs file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  final productRepository = ProductRepository();

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    print('Aguarde...');
    final filePath = argResults?['file'];
    final id = argResults?['id'];

    if (id == null) {
      print('Por favor informe o id do aluno com o comando --id=0 ou -i = 0');
      return;
    }

    final students = File(filePath).readAsLinesSync();
    print('Aguarde, atualizando dados do aluno...');
    print('----------------------------------------');

    if (students.length > 1) {
      print('Por favor informe somente um aluno no arquivo $filePath');
      return;
    } else if (students.isEmpty) {
      print('Por favor informe um aluno no arquivo $filePath');
      return;
    }

    var student = students.first;


      final studentData = student.split(';');
      final courseCvs = studentData[2].split(',').map((e) => e.trim()).toList();

      final cousesFutures = courseCvs.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(cousesFutures);

      final studentsModel = StudentsModel(
          id: int.parse(id),
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

      await studentRepository.update(studentsModel);
    
    print('----------------------------------------');
    print('Aluno atualizado com sucesso');
  }
}
