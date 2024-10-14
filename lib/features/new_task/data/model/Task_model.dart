import 'package:todo/features/all_task/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity{
  TaskModel({
    super.todos,
    super.total,
    super.skip,
    super.limit,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      todos: (json["todos"] as List).map((e)=>TodoModel.fromJson(e)).toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todos': todos,
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class TodoModel extends TodoEntity{

  TodoModel({
    super.id,
    super.todo,
    super.completed,
    super.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }
}
