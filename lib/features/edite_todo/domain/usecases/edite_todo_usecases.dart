import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/edite_todo/domain/repository/edite_todo_repository.dart';

class EditeTodoComponents
    extends UseCase<TodoEntity, EditeTodoParams> {
  final EditeTodoRepository repository;

  EditeTodoComponents({required this.repository});

  @override
  Future<Either<Failure?, TodoEntity>> call(EditeTodoParams params) {
    return repository.getEditeTodo(params);
  }

}
class EditeTodoParams {
  final bool completed;
  final int id;
  EditeTodoParams({required this.completed,required this.id});

  toJson(){
    return {
      "completed":completed
    };
  }
}

