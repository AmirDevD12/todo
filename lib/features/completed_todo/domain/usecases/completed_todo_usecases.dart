import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/completed_todo/domain/repository/completed_todo_repository.dart';

class CompletedTodoComponents
    extends UseCase<TaskEntity, NoParams> {
  final CompletedTodoRepository repository;

  CompletedTodoComponents({required this.repository});

  @override
  Future<Either<Failure?, TaskEntity>> call(NoParams params) {
    return repository.getCompletedTodo(params);
  }

}


