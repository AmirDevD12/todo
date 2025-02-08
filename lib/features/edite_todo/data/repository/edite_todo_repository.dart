import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/edite_todo/data/datasource/edite_todo_datasource.dart';
import 'package:todo/features/edite_todo/domain/repository/edite_todo_repository.dart';
import 'package:todo/features/edite_todo/domain/usecases/edite_todo_usecases.dart';

class EditeTodoRepositoryImp extends EditeTodoRepository {
  final EditeTodoDataSource _editeTodoDataSource;

  EditeTodoRepositoryImp(this._editeTodoDataSource);


  Future<Either<Failure?, TodoModel>> getEditeTodo(EditeTodoParams params) async {
    try {
      var response = await _editeTodoDataSource.getEditeTodo(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure("خطا",
          e.response != null ? e.response!.data["error"] : e.error.toString()));
    }
  }
}
