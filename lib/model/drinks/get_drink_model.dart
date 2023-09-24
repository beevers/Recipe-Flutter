import 'package:json_annotation/json_annotation.dart';

part 'get_drink_model.g.dart';

@JsonSerializable()
class DrinksModel {
  List<DrinksModelData>? recommendedWines;
  DrinksModel({this.recommendedWines});

  factory DrinksModel.fromJson(Map<String, dynamic> json) =>
      _$DrinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksModelToJson(this);
}

@JsonSerializable()
class DrinksModelData {
  int? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  double? ratingCount;
  double? score;
  String? link;

  DrinksModelData(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.averageRating,
      this.ratingCount,
      this.score,
      this.link});

  factory DrinksModelData.fromJson(Map<String, dynamic> json) =>
      _$DrinksModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksModelDataToJson(this);
}
