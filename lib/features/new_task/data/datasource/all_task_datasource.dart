import 'dart:convert';

import 'package:todo/core/repository/base_repository.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/new_task/domain/usecases/all_task_usecases.dart';

import '../../../../core/network/i_api_request_manager.dart';

abstract class NewTodoDatasource {
  Future<TodoModel> postNewTask(NewTodoParams params);
}

class NewTodoDatasourceIml extends BaseRepository implements NewTodoDatasource {
  NewTodoDatasourceIml(
    IHttpClient httpClient,
  ) : super(httpClient);

  @override
  Future<TodoModel> postNewTask(NewTodoParams params) async {
    var request = await httpClient.postRequest(
        path: '/todos/add', data: jsonEncode(params.toJson()));
    final response = TodoModel.fromJson(request);

    return response;
  }
}
