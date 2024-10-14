import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/new_task/domain/usecases/all_task_usecases.dart';
abstract class NewTodoRepository {
  Future<Either<Failure?, TodoEntity>> postNewTodo(NewTodoParams params);
}