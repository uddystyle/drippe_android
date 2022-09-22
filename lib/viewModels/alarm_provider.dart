import 'package:drippe/models/alarm.dart';
import 'package:drippe/repositories/alarm_repository.dart';
import 'package:sqflite/sqflite.dart';

class AlarmProvider {
  // static Database? database;
  // static const String tableName = 'alarm';

  static String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds".split('.').first.padLeft(5, '0');
  }

  // static Future<List<Alarm>> getData() async {
  //   final List<Map<String, dynamic>> maps = await database!.query(tableName);
  //   print("alarmList: $maps");
  //   if (maps.isEmpty) {
  //     return [];
  //   } else {
  //     List<Alarm> alarmList = List.generate(
  //         maps.length,
  //         (index) => Alarm(
  //             id: maps[index]['id'],
  //             alarmTime: Duration(
  //               minutes: int.parse(((maps[index]['alarm_time']).split(':'))[0]),
  //               seconds: int.parse(((maps[index]['alarm_time']).split(':'))[1]),
  //             ),
  //             isActive: maps[index]['is_active'] == 1 ? true : false));
  //     return alarmList;
  //   }
  // }
}
