
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalali_table_calendar_plus/jalali_table_calendar_plus.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/core/utils/my_date_time_format.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({Key? key, required this.onDateSelected}) : super(key: key);

  final Function(String startDate, String endDate)? onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width,
      padding: const EdgeInsets.only(top: MySpaces.s12, bottom: MySpaces.s24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 5,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFD0D5DD),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            JalaliTableCalendar(
                range: true,
                onRangeSelected: (selectedDates) {
                  onDateSelected!(MyDateTimeFormat.convertDateToJalali(date: selectedDates.first),
                      MyDateTimeFormat.convertDateToJalali(date: selectedDates.last));
                  Get.back();
                })
          ],
        ),
      ),
    );
  }
}
