import 'package:flutter/material.dart';
import 'package:todo/common_ui/widgets/my_card.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';

class ItemCompletedTodo extends StatelessWidget {
  final TodoEntity data;
  const ItemCompletedTodo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      cardType: CardType.completedTodo,
      title: "task ${data.id.toString()}",
      detail: data.todo??"",
      onTap:null,
    );
  }
}
