import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/new_task/data/datasource/all_task_datasource.dart';
import 'package:todo/features/new_task/domain/repository/all_task_repository.dart';
import 'package:todo/features/new_task/domain/usecases/all_task_usecases.dart';

class NewTodoRepositoryImp extends NewTodoRepository {
  final NewTodoDatasource _newTodoDatasourceIml;

  NewTodoRepositoryImp(this._newTodoDatasourceIml);

  @override
  Future<Either<Failure?, TodoEntity>> postNewTodo(NewTodoParams params) async {
    try {
      var response = await _newTodoDatasourceIml.postNewTask(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure("خطا",
          e.response != null ? e.response!.data["error"] : e.error.toString()));
    }
  }
}
