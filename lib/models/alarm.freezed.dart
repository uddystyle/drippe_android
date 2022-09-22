// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Alarm {
  int? get id => throw _privateConstructorUsedError;
  Duration get alarmTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call(
      {int? id, Duration alarmTime, @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? alarmTime = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      alarmTime: alarmTime == freezed
          ? _value.alarmTime
          : alarmTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$$_AlarmCopyWith(_$_Alarm value, $Res Function(_$_Alarm) then) =
      __$$_AlarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, Duration alarmTime, @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$_AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res>
    implements _$$_AlarmCopyWith<$Res> {
  __$$_AlarmCopyWithImpl(_$_Alarm _value, $Res Function(_$_Alarm) _then)
      : super(_value, (v) => _then(v as _$_Alarm));

  @override
  _$_Alarm get _value => super._value as _$_Alarm;

  @override
  $Res call({
    Object? id = freezed,
    Object? alarmTime = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Alarm(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      alarmTime: alarmTime == freezed
          ? _value.alarmTime
          : alarmTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Alarm implements _Alarm {
  const _$_Alarm(
      {this.id,
      this.alarmTime = const Duration(minutes: 0, seconds: 0),
      @JsonKey(name: 'is_active') this.isActive = true});

  @override
  final int? id;
  @override
  @JsonKey()
  final Duration alarmTime;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'Alarm(id: $id, alarmTime: $alarmTime, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Alarm &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.alarmTime, alarmTime) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(alarmTime),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      __$$_AlarmCopyWithImpl<_$_Alarm>(this, _$identity);
}

abstract class _Alarm implements Alarm {
  const factory _Alarm(
      {final int? id,
      final Duration alarmTime,
      @JsonKey(name: 'is_active') final bool isActive}) = _$_Alarm;

  @override
  int? get id;
  @override
  Duration get alarmTime;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      throw _privateConstructorUsedError;
}
