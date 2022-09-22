import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drippe/models/alarm.dart';

part 'alarm_state.freezed.dart';

@freezed
abstract class AlarmState with _$AlarmState {
  const factory AlarmState({
    @Default([]) List<Alarm> alarms,
  }) = _AlarmState;
}
