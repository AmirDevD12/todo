import 'package:equatable/equatable.dart';

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
