
import 'dart:convert';

import 'package:todo/core/repository/base_repository.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/edite_todo/domain/usecases/edite_todo_usecases.dart';

import '../../../../core/network/i_api_request_manager.dart';

abstract class EditeTodoDataSource {
  Future<TodoModel> getEditeTodo(EditeTodoParams params);
}

class EditeTodoDataSourceIml extends BaseRepository implements EditeTodoDataSource {
  EditeTodoDataSourceIml(
      IHttpClient httpClient,
      ) : super(httpClient);

  @override
  Future<TodoModel> getEditeTodo(EditeTodoParams params) async {
    var request = await httpClient.putRequest(
      path: '/todos/${params.id}',
      data: jsonEncode(params.toJson())
    );
    final response=  TodoModel.fromJson(request);
    return response;
  }

}
