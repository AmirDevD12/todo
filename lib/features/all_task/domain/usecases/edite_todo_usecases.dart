import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/all_task/domain/repository/all_task_repository.dart';

import 'package:todo/core/usecases/usecase.dart';

class EditeTodoComponents
    extends UseCase<TaskEntity, NoParams> {
  final AllTaskRepository repository;

  EditeTodoComponents({required this.repository});

  @override
  Future<Either<Failure?, TaskEntity>> call(NoParams params) {
    return repository.getAllTask(params);
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

