import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/new_task/domain/repository/all_task_repository.dart';

class NewTodoComponents
    extends UseCase<TodoEntity, NewTodoParams> {
  final NewTodoRepository repository;

  NewTodoComponents({required this.repository});

  @override
  Future<Either<Failure?, TodoEntity>> call(NewTodoParams params) {
    return repository.postNewTodo(params);
  }
}
class NewTodoParams{
 final String todo;
 final bool completed;

  NewTodoParams({required this.todo, required this.completed});

 toJson(){
   return {
     "todo":todo,
     "completed":completed,
     "userId":1
   };
 }
}

