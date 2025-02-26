// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habito.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitoImpl _$$HabitoImplFromJson(Map<String, dynamic> json) => _$HabitoImpl(
      uuid: json['uuid'] as String,
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      regularityDays: (json['regularity_days'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dailyRecurrence: (json['daily_recurrence'] as num?)?.toInt() ?? 1,
      reminders: (json['reminders'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      iconCode: (json['iconCode'] as num?)?.toInt(),
      colorHex: _colorHexFromJson(json['color_hex'] as String?),
      completedDates: (json['completed_dates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const <DateTime>[],
      lastCompletedAt: json['last_completed_at'] == null
          ? null
          : DateTime.parse(json['last_completed_at'] as String),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$HabitoImplToJson(_$HabitoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'regularity_days': instance.regularityDays,
      'daily_recurrence': instance.dailyRecurrence,
      'reminders': instance.reminders.map((e) => e.toIso8601String()).toList(),
      'iconCode': instance.iconCode,
      'color_hex': _colorHexToJson(instance.colorHex),
      'completed_dates':
          instance.completedDates.map((e) => e.toIso8601String()).toList(),
      'last_completed_at': instance.lastCompletedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
