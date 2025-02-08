import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/completed_todo/data/datasource/completed_todo_datasource.dart';
import 'package:todo/features/completed_todo/domain/repository/completed_todo_repository.dart';

class CompletedTodoRepositoryImp extends CompletedTodoRepository {
  final CompletedTodoDataSource _getCompletedTodoDataSource;

  CompletedTodoRepositoryImp(this._getCompletedTodoDataSource);

  @override
  Future<Either<Failure?, TaskModel>> getCompletedTodo(NoParams params) async {
    try {
      var response = await _getCompletedTodoDataSource.getCompleted(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure("خطا",
          e.response != null ? e.response!.data["error"] : e.error.toString()));
    }
  }
}
