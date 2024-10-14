import 'package:shamsi_date/shamsi_date.dart';

class MyDateTimeFormat {
  static String parsDataTimeToJalali({required DateTime dataTime}) {
    String date = "${dataTime.year}-${dataTime.month}-${dataTime.day}";
    String time = "${dataTime.hour}:${dataTime.minute}";
    return "$time $date";
  }

  static String parsDataTimeToJalaliWithDate({required DateTime dataTime}) {
    String date = "${dataTime.year}/${dataTime.month}/${dataTime.day}";
    return date;
  }

  static String convertDateToJalali({required DateTime date}) {
    Jalali j = Jalali.fromDateTime(date);
    return "${j.year}-${j.month}-${j.day}";
  }

  static String parsDataTimeToJalaliForChat({required DateTime dateTime}) {
    String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String time = "${dateTime.hour}:${dateTime.minute}";
    if(dateTime.day == Jalali.now().day){
      return time;
    }else{
      return" $time $date";
    }
  }
  static String dateTimeNow() {
    Gregorian g1 = Gregorian.now();
    Jalali j1 = g1.toJalali();
    final f = j1.formatter;
    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }
}
