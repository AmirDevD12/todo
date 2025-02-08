import 'package:equatable/equatable.dart';

class TaskEntity with EquatableMixin{
  List<TodoEntity>? todos;
  int? total;
  int? skip;
  int? limit;

  TaskEntity({
     this.todos,
     this.total,
     this.skip,
     this.limit,
  });
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TodoEntity with EquatableMixin{
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  TodoEntity({
     this.id,
     this.todo,
     this.completed,
     this.userId,
  });
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
