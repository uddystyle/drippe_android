// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alarm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlarmState {
  List<Alarm> get alarms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmStateCopyWith<AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
          AlarmState value, $Res Function(AlarmState) then) =
      _$AlarmStateCopyWithImpl<$Res>;
  $Res call({List<Alarm> alarms});
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res> implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  final AlarmState _value;
  // ignore: unused_field
  final $Res Function(AlarmState) _then;

  @override
  $Res call({
    Object? alarms = freezed,
  }) {
    return _then(_value.copyWith(
      alarms: alarms == freezed
          ? _value.alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<Alarm>,
    ));
  }
}

/// @nodoc
abstract class _$$_AlarmStateCopyWith<$Res>
    implements $AlarmStateCopyWith<$Res> {
  factory _$$_AlarmStateCopyWith(
          _$_AlarmState value, $Res Function(_$_AlarmState) then) =
      __$$_AlarmStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Alarm> alarms});
}

/// @nodoc
class __$$_AlarmStateCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements _$$_AlarmStateCopyWith<$Res> {
  __$$_AlarmStateCopyWithImpl(
      _$_AlarmState _value, $Res Function(_$_AlarmState) _then)
      : super(_value, (v) => _then(v as _$_AlarmState));

  @override
  _$_AlarmState get _value => super._value as _$_AlarmState;

  @override
  $Res call({
    Object? alarms = freezed,
  }) {
    return _then(_$_AlarmState(
      alarms: alarms == freezed
          ? _value._alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<Alarm>,
    ));
  }
}

/// @nodoc

class _$_AlarmState implements _AlarmState {
  const _$_AlarmState({final List<Alarm> alarms = const []}) : _alarms = alarms;

  final List<Alarm> _alarms;
  @override
  @JsonKey()
  List<Alarm> get alarms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alarms);
  }

  @override
  String toString() {
    return 'AlarmState(alarms: $alarms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlarmState &&
            const DeepCollectionEquality().equals(other._alarms, _alarms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_alarms));

  @JsonKey(ignore: true)
  @override
  _$$_AlarmStateCopyWith<_$_AlarmState> get copyWith =>
      __$$_AlarmStateCopyWithImpl<_$_AlarmState>(this, _$identity);
}

abstract class _AlarmState implements AlarmState {
  const factory _AlarmState({final List<Alarm> alarms}) = _$_AlarmState;

  @override
  List<Alarm> get alarms;
  @override
  @JsonKey(ignore: true)
  _$$_AlarmStateCopyWith<_$_AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}
