import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drippe/models/alarm.dart';
import 'package:drippe/databases/alarm_database.dart';
import 'package:drippe/repositories/alarm_repository.dart';
import 'package:drippe/states/alarm_state.dart';

final alarmViewModelProvider = StateNotifierProvider(
  (ref) => AlarmViewModelProvider(
    ref.read,
    AlarmRepository(AlarmDatabase()),
  ),
);

class AlarmViewModelProvider extends StateNotifier<AlarmState> {
  AlarmViewModelProvider(this._reader, this._alarmRepository)
      : super(const AlarmState()) {
    getAlarm();
  }

  final Reader _reader;
  final AlarmRepository _alarmRepository;

  Future<void> addAlarm(Duration alarmTime) async {
    final alarm = await _alarmRepository.addAlarm(Alarm(
      alarmTime: alarmTime,
      isActive: true,
    ));

    state = state.copyWith(
      alarms: [alarm, ...state.alarms],
    );
  }

  static String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds".split('.').first.padLeft(5, '0');
  }

  Future<void> updateAlarm(Alarm alarm) async {
    final newAlarm = alarm.copyWith(
      alarmTime: alarm.alarmTime,
      isActive: alarm.isActive,
    );

    await _alarmRepository.updateAlarm(alarm);
    final newAlarms =
        state.alarms.map((e) => e.id == newAlarm.id ? newAlarm : e).toList();

    state = state.copyWith(
      alarms: newAlarms,
    );
  }

  Future<void> changeStatus(Alarm alarm, int value) async {
    final newAlarm = alarm.copyWith(
      isActive: value == 1 ? true : false,
    );

    await _alarmRepository.updateAlarm(newAlarm);

    final alarms = state.alarms
        .map((alarm) => alarm.id == newAlarm.id ? newAlarm : alarm)
        .toList();

    state = state.copyWith(alarms: alarms);
    print("======================");
    print("changeStatus: $alarms");
  }

  Future<void> getAlarm() async {
    final alarms = await _alarmRepository.getAlarm();

    state = state.copyWith(
      alarms: alarms,
    );
    print("======================");
    print("getAlarm: $alarms");
  }

  Future<void> deleteAlarm(int alarmId) async {
    await _alarmRepository.deleteAlarm(alarmId);

    final alarms = state.alarms.where((alarm) => alarm.id != alarmId).toList();

    state = state.copyWith(
      alarms: alarms,
    );
  }
}
