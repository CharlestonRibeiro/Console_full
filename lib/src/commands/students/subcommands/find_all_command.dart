import 'dart:io';

import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindAllCommand extends Command {
  final StudentRepository studentRepository;

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  FindAllCommand(this.studentRepository);

  @override
  void run() async {
    print('Aguarde buscando alunos...');
    final students = await studentRepository.findAll();
    print('Apresentar também os cursos? (S ou N)');

    final showCourses = stdin.readLineSync();
    print('-------------------------------');
    print('Alunos:');
    print('-------------------------------');
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print('${student.id} - ${student.name} ${student.nameCourses}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
