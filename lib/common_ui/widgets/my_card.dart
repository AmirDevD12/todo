
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';

import '../resource/my_colors.dart';
import '../resource/my_spaces.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.cardType,
      required this.title,
      required this.detail,
      this.description,
        this.completed=false,
        this.onTapDelete,
        this.onTapEdite,
        required this.onTap

});

  final String? title;
  final String? description;
  final String? detail;
  final Function()? onTapDelete;
  final Function()? onTapEdite;
  final Function()? onTap;
  final CardType cardType;
  final bool completed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(MySpaces.s20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C101828),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            if (cardType == CardType.todo) ...{
              _todoCard()
            }else if(cardType == CardType.completedTodo)...{
              _completedTodoCard()
            }
          ],
        ),
      ),
    );
  }

  Widget _completedTodoCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: MySpaces.s16,),
        const Icon(Hicons.tick_bold,color: MyColors.iconTask,) ,
        const SizedBox(
          width: MySpaces.s16,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title??"",softWrap: true,overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextBoldStyle.md.copyWith(
                      color: MyColors.primaryColor
                    ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MySpaces.s8,),
              Row(
                children: [
                  Expanded(
                    child: Text(detail??"",softWrap: true,overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextMediumStyle.xs.copyWith(
                      color: Colors.black
                    ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),


      ],
    );
  }
  Widget _todoCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(completed?Hicons.tick_bold: Hicons.tick_square_light_outline,color: MyColors.iconTask,) ,
            const SizedBox(width: MySpaces.s16,),
             GestureDetector(
                 onTap: onTapDelete,
                 child: const Icon(Hicons.delete_1_light_outline,color: MyColors.iconTask,),),
            const SizedBox(width: MySpaces.s16,),
            GestureDetector(
                onTap: onTapEdite,
                child: const Icon(Hicons.edit_1_light_outline,color: MyColors.iconTask,)),
            const SizedBox(width: MySpaces.s16,)

          ],
        ),
        const SizedBox(
          width: MySpaces.s16,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title??"",softWrap: true,overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextBoldStyle.md.copyWith(
                      color: MyColors.primaryColor
                    ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: MySpaces.s8,),
              Row(
                children: [
                  Expanded(
                    child: Text(detail??"",softWrap: true,overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextMediumStyle.xs.copyWith(
                      color: Colors.black
                    ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),


      ],
    );
  }
}

enum CardType { todo,completedTodo }
