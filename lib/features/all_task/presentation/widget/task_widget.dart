import 'package:flutter/material.dart';
import 'package:todo/common_ui/widgets/my_card.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';

class ItemTask extends StatelessWidget {
  final TodoEntity data;
  final Function(TodoEntity)? onTapDelete;
  final Function(TodoEntity)? onTapEdite;

  const ItemTask({super.key, required this.data, this.onTapDelete,this.onTapEdite});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      cardType: CardType.todo,
      title: "task ${data.id.toString()}",
      detail: data.todo??"",
      onTapEdite: onTapEdite != null ? () => onTapEdite!(data) : null,
      onTapDelete: onTapDelete != null ? () => onTapDelete!(data) : null,
      onTap:null,
      completed: data.completed??false,
    );
  }
}
