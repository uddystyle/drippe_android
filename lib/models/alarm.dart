import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';

@freezed
abstract class Alarm with _$Alarm {
  const factory Alarm({
    int? id,
    @Default(Duration(minutes: 0, seconds: 0)) Duration alarmTime,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _Alarm;
}
