import 'package:todo/core/repository/base_repository.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/data/model/Task_model.dart';
import 'package:todo/features/all_task/domain/usecases/delete_todo_usecas.dart';

import '../../../../core/network/i_api_request_manager.dart';

abstract class CompletedTodoDataSource {
  Future<TaskModel> getCompleted(NoParams params);
}

class CompletedTodoDataSourceImp extends BaseRepository implements CompletedTodoDataSource {
  CompletedTodoDataSourceImp(
    IHttpClient httpClient,
  ) : super(httpClient);

  @override
  Future<TaskModel> getCompleted(NoParams params) async {
    var request = await httpClient.getRequest(
      path: '/todos',
    );
    final response = TaskModel.fromJson(request);
    return response;
  }
}
