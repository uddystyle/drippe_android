import 'package:drippe/models/alarm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AlarmProvider {
  static Database? database;
  static const String tableName = 'alarm';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, alarm_time TEXT, is_active INTEGER)');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'alarm.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  static Future<Database?> setDb() async {
    if (database == null) {
      database = await initDb();
      return database;
    } else {
      return database;
    }
  }

  static Future<void> insertData(Alarm alarm) async {
    await database!.insert(tableName, {
      'alarm_time': stringDuration(alarm.alarmTime),
      'is_active': alarm.isActive ? 0 : 1
    });
  }

  static String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds".split('.').first.padLeft(5, '0');
  }

  static Future<List<Alarm>> getData() async {
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    if (maps.isEmpty) {
      return [];
    } else {
      List<Alarm> alarmList = List.generate(
          maps.length,
          (index) => Alarm(
              id: maps[index]['id'],
              alarmTime: Duration(
                minutes: int.parse(((maps[index]['alarm_time']).split(':'))[0]),
                seconds: int.parse(((maps[index]['alarm_time']).split(':'))[1]),
              ),
              isActive: maps[index]['is_active'] == 0 ? true : false));
      return alarmList;
    }
  }

  static Future<void> updateData(Alarm alarm) async {
    await database!.update(
      tableName,
      {
        'alarm_time': stringDuration(alarm.alarmTime),
        'is_active': alarm.isActive ? 0 : 1
      },
      where: 'id = ?',
      whereArgs: [alarm.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteData(int id) async {
    await database!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
