// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeState {
  List<Recipe> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeStateCopyWith<RecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res>;
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res> implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  final RecipeState _value;
  // ignore: unused_field
  final $Res Function(RecipeState) _then;

  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_value.copyWith(
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeStateCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$_RecipeStateCopyWith(
          _$_RecipeState value, $Res Function(_$_RecipeState) then) =
      __$$_RecipeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class __$$_RecipeStateCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_RecipeStateCopyWith<$Res> {
  __$$_RecipeStateCopyWithImpl(
      _$_RecipeState _value, $Res Function(_$_RecipeState) _then)
      : super(_value, (v) => _then(v as _$_RecipeState));

  @override
  _$_RecipeState get _value => super._value as _$_RecipeState;

  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_$_RecipeState(
      recipes: recipes == freezed
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$_RecipeState implements _RecipeState {
  const _$_RecipeState({final List<Recipe> recipes = const []})
      : _recipes = recipes;

  final List<Recipe> _recipes;
  @override
  @JsonKey()
  List<Recipe> get recipes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'RecipeState(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeState &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeStateCopyWith<_$_RecipeState> get copyWith =>
      __$$_RecipeStateCopyWithImpl<_$_RecipeState>(this, _$identity);
}

abstract class _RecipeState implements RecipeState {
  const factory _RecipeState({final List<Recipe> recipes}) = _$_RecipeState;

  @override
  List<Recipe> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeStateCopyWith<_$_RecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}
