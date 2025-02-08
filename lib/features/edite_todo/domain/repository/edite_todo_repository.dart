import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/edite_todo/domain/usecases/edite_todo_usecases.dart';
abstract class EditeTodoRepository {
  Future<Either<Failure?, TodoEntity>> getEditeTodo(EditeTodoParams params);
}