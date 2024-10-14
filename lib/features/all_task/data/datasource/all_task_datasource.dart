
import 'dart:convert';

import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/core/reponse/base_response.dart';
import 'package:todo/core/repository/base_repository.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/all_task/domain/usecases/edite_todo_usecases.dart';

import '../../../../core/network/i_api_request_manager.dart';

abstract class AllTaskDataSource {
  Future<TaskModel> getAllTask(NoParams params);
  Future<TodoModel> getEditeTodo(EditeTodoParams params);
}

class AllTaskDataSourceIml extends BaseRepository implements AllTaskDataSource {
  AllTaskDataSourceIml(
      IHttpClient httpClient,
      ) : super(httpClient);

  @override
  Future<TaskModel> getAllTask(NoParams params) async {
    var request = await httpClient.getRequest(
      path: '/todos',
    );
   final response=  TaskModel.fromJson(request);
    return response;
  }
  @override
  Future<TodoModel> getEditeTodo(EditeTodoParams params) async {
    var request = await httpClient.putRequest(
      path: '/todos/${params.id}/',
      data: jsonEncode(params.toJson())
    );
    final response=  TodoModel.fromJson(request);
    return response;
  }
}
