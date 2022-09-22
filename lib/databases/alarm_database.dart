import 'package:drippe/databases/app_alarm_database.dart';
import 'package:drippe/models/alarm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AlarmDatabase extends AppAlarmDatabase {
  final String _tableName = 'alarm';

  Future<List<Alarm>> getAlarm() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(_tableName, orderBy: 'id ASC');
    print("alarmList: $maps");

    if (maps.isEmpty) {
      return [];
    } else {
      List<Alarm> alarmList = List.generate(
          maps.length,
          (index) => Alarm(
              id: maps[index]['id'],
              alarmTime: Duration(
                minutes: int.parse(((maps[index]['alarmTime']).split(':'))[0]),
                seconds: int.parse(((maps[index]['alarmTime']).split(':'))[1]),
              ),
              isActive: maps[index]['is_active'] == 1 ? true : false));
      return alarmList;
    }
  }

  Future<Alarm> insert(Alarm alarm) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      {
        'alarmTime': stringDuration(alarm.alarmTime),
        'is_active': alarm.isActive
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return alarm.copyWith(
      id: id,
    );
  }

  static String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds".split('.').first.padLeft(5, '0');
  }

  Future update(Alarm alarm) async {
    final db = await database;

    return await db.update(
      _tableName,
      {
        'alarmTime': stringDuration(alarm.alarmTime),
        'is_active': alarm.isActive ? 0 : 1
      },
      where: 'id = ?',
      whereArgs: [alarm.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
