import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/all_task/domain/repository/all_task_repository.dart';

import 'package:todo/core/usecases/usecase.dart';

class DeleteTodoComponents
    extends UseCase<TodoEntity, DeleteTodoParams> {
  final AllTaskRepository repository;

  DeleteTodoComponents({required this.repository});

  @override
  Future<Either<Failure?, TodoEntity>> call(DeleteTodoParams params) {
    return repository.getDeleteTodo(params);
  }

}
class DeleteTodoParams {
  final int id;
  DeleteTodoParams({required this.id});


}

