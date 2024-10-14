import 'package:uuid/uuid.dart';

class MyUuid{
  static String generate() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}