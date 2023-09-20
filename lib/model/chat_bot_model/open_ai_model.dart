import 'package:json_annotation/json_annotation.dart';

part 'open_ai_model.g.dart';

@JsonSerializable()
class OpenAiResponseModel {
  OpenAiData? data;

  OpenAiResponseModel({this.data});
  factory OpenAiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OpenAiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$OpenAiResponseModelToJson(this);
}

@JsonSerializable()
class OpenAiData {
  String? model;
  String? object;
  List<Map<String, dynamic>>? choices;
  dynamic created;
  String? id;
  Map<String, dynamic>? usage;

  OpenAiData({
    this.usage,
    this.model,
    this.object,
    this.choices,
    this.created,
    this.id,
  });

  factory OpenAiData.fromJson(Map<String, dynamic> json) =>
      _$OpenAiDataFromJson(json);
  Map<String, dynamic> toJson() => _$OpenAiDataToJson(this);
}
