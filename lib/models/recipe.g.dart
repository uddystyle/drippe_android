// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as int?,
      ratio: json['ratio'] as String? ?? '',
      label: json['label'] as String? ?? '',
      grind: json['grind'] as String? ?? '',
      roast: json['roast'] as String? ?? '',
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'ratio': instance.ratio,
      'label': instance.label,
      'grind': instance.grind,
      'roast': instance.roast,
    };
