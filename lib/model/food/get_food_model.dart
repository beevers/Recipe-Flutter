import 'package:json_annotation/json_annotation.dart';

part 'get_food_model.g.dart';

@JsonSerializable()
class FoodModel {
  String? sorting;
  Map? filterMapping;
  List? filterOptions;
  List? activeFilterOptions;
  String? query;
  int? totalResults;
  int? limit;
  int? offset;
  List<FoodModelData>? searchResults;
  int? expires;

  FoodModel(
      {this.sorting,
      this.filterMapping,
      this.filterOptions,
      this.activeFilterOptions,
      this.query,
      this.totalResults,
      this.limit,
      this.offset,
      this.searchResults});

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}

@JsonSerializable()
class FoodModelData {
  String? name;
  String? type;
  int? totalResults;
  int? totalResultsVariants;
  List<FoodModelDataResult>? results;

  FoodModelData(
      {this.name,
      this.type,
      this.totalResults,
      this.totalResultsVariants,
      this.results});

  factory FoodModelData.fromJson(Map<String, dynamic> json) =>
      _$FoodModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelDataToJson(this);
}

@JsonSerializable()
class FoodModelDataResult {
  int? id;
  String? name;
  String? image;
  String? link;
  String? type;
  num? relevance;
  String? content;

  FoodModelDataResult(
      {this.id,
      this.name,
      this.image,
      this.link,
      this.type,
      this.relevance,
      this.content});

  factory FoodModelDataResult.fromJson(Map<String, dynamic> json) =>
      _$FoodModelDataResultFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelDataResultToJson(this);
}
