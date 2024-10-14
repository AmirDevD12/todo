import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/data/datasource/all_task_datasource.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/all_task/domain/repository/all_task_repository.dart';
import 'package:todo/features/all_task/domain/usecases/edite_todo_usecases.dart';

class AllTaskRepositoryImp extends AllTaskRepository {
  final AllTaskDataSource _allTaskDataSource;

  AllTaskRepositoryImp(this._allTaskDataSource);

  @override
  Future<Either<Failure?, TaskModel>> getAllTask(NoParams params) async {
    try {
      var response = await _allTaskDataSource.getAllTask(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure("خطا",
          e.response != null ? e.response!.data["error"] : e.error.toString()));
    }
  }
  Future<Either<Failure?, TodoModel>> getEditeTodo(EditeTodoParams params) async {
    try {
      var response = await _allTaskDataSource.getEditeTodo(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure("خطا",
          e.response != null ? e.response!.data["error"] : e.error.toString()));
    }
  }
}
