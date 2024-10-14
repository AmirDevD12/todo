import 'package:flutter/material.dart';
import 'package:todo/common_ui/widgets/my_card.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';

class ItemTask extends StatelessWidget {
  final TodoEntity data;
  final Function(TodoEntity)? onTap;

  const ItemTask({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      cardType: CardType.task,
      title: "task ${data.id.toString()}",
      detail: data.todo??"",
      onTap: onTap != null ? () => onTap!(data) : null,
      completed: data.completed??false,
    );
  }
}
