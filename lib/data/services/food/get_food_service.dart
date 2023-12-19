import 'package:recipe_app/data/api/api_manager.dart';
import 'package:recipe_app/model/food/get_food_model.dart';

class GetFoodService extends ApiManager {
  final String getFoodUrl = '/food/search';

  Future<FoodModel> getFoodService({required int number, String? query}) async {
    final response = await getHttp(
      "$getFoodUrl?query=$query&number=$number",
    );
    return FoodModel.fromJson(response.data);
  }
}
