import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
abstract class CompletedTodoRepository {
  Future<Either<Failure?, TaskEntity>> getCompletedTodo(NoParams params);
}