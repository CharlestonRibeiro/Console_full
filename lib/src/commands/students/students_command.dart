import 'package:adf_cli/src/commands/students/subcommands/delete_comand.dart';
import 'package:adf_cli/src/commands/students/subcommands/find_all_command.dart';
import 'package:adf_cli/src/commands/students/subcommands/find_by_id_command.dart';
import 'package:adf_cli/src/commands/students/subcommands/insert_command.dart';
import 'package:adf_cli/src/commands/students/subcommands/update_command.dart';
import 'package:adf_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(studentRepository));
    addSubcommand(FindByIdCommand(studentRepository));
    addSubcommand(InsertCommand(studentRepository));
    addSubcommand(UpdateCommand(studentRepository));
    addSubcommand(DeleteCommand(studentRepository));
  }
}
