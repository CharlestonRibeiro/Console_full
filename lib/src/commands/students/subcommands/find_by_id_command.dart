import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  FindByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  String get description => 'Find Students By Id';

  @override
  String get name => 'byId';

  
  

  @override
  void run() async {
    if (argResults?['id'] == null) {
      print('por favor envie o id do aluno com o comando --id=0 -i 0');
      return;
    }

    final id = int.parse(argResults?['id']);

    print('Aguarde buscando dados...');
    final student = await studentRepository.findById(id);
    print('-------------------------------------------');
    print('Aluno ${student.name}');
    print('-------------------------------------------');
    print('Nome ${student.name}');
    print('Idade ${student.age ?? 'Não informado'}');
    print('Curso:');
    student.nameCourses.forEach(print);
    print('Endereço:');
    print('${student.address.street} ${student.address.zipCode}');
  }
}
