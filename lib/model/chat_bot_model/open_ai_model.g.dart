// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenAiResponseModel _$OpenAiResponseModelFromJson(Map<String, dynamic> json) =>
    OpenAiResponseModel(
      data: json['data'] == null
          ? null
          : OpenAiData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenAiResponseModelToJson(
        OpenAiResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OpenAiData _$OpenAiDataFromJson(Map<String, dynamic> json) => OpenAiData(
      usage: json['usage'] as Map<String, dynamic>?,
      model: json['model'] as String?,
      object: json['object'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      created: json['created'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$OpenAiDataToJson(OpenAiData instance) =>
    <String, dynamic>{
      'model': instance.model,
      'object': instance.object,
      'choices': instance.choices,
      'created': instance.created,
      'id': instance.id,
      'usage': instance.usage,
    };
