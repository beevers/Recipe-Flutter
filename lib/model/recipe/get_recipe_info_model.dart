import 'package:json_annotation/json_annotation.dart';
part 'get_recipe_info_model.g.dart';

@JsonSerializable()
class GetRecipeInfoModel {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  num? weightWatcherSmartPoints;
  String? gaps;
  num? preparationMinutes;
  num? cookingMinutes;
  num? aggregateLikes;
  num? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  num? pricePerServing;
  List? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List? cuisines;
  List? dishTypes;
  List? diets;
  List? occasions;
  Map? winePairing;
  String? instructions;
  List? analyzedInstructions;
  dynamic originalId;
  num? spoonacularScore;
  String? spoonacularSourceUrl;

  GetRecipeInfoModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  factory GetRecipeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$GetRecipeInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetRecipeInfoModelToJson(this);
}
