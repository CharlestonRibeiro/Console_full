import 'dart:io';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class DeleteCommand extends Command {
  final StudentRepository studentRepository;
  DeleteCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }


  @override
  String get description => 'Delete Student by id';

  @override
  String get name => 'delete';

  @override
  Future<void> run() async {
    final id = int.tryParse(argResults?['id']);

    if (id == null) {
      print('Por favor informe o id do aluno com o comando --id=0 ou -i = 0');
      return;
    }

    print('Aguarde...');
    final student = await studentRepository.findById(id);

    print('confirma a exclusão do aluno ${student.name}? (S ou N)');

    final confirmDelete = stdin.readLineSync();

    if (confirmDelete?.toLowerCase() == 's') {
      await studentRepository.deleteById(id);
      print('----------------------------------------');
      print('Aluno deletado com sucesso');
      print('----------------------------------------');
    } else {
      print('----------------------------------------');
      print('Operação cancelada!!!');
      print('----------------------------------------');
    }
  }
}
