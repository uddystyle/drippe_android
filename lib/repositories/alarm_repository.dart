import 'package:drippe/databases/alarm_database.dart';
import 'package:drippe/models/alarm.dart';

class AlarmRepository {
  final AlarmDatabase _alarmDatabase;

  AlarmRepository(this._alarmDatabase);

  Future<List<Alarm>> getAlarm() async {
    return _alarmDatabase.getAlarm();
  }

  Future<Alarm> addAlarm(Alarm alarm) async {
    return _alarmDatabase.insert(alarm);
  }

  Future<void> updateAlarm(Alarm alarm) async {
    return _alarmDatabase.update(alarm);
  }

  Future<void> deleteAlarm(int id) async {
    return _alarmDatabase.delete(id);
  }
}
