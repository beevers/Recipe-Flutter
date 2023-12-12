import 'package:recipe_app/data/api/api_manager.dart';
import 'package:recipe_app/model/drinks/get_drink_model.dart';

class GetDrinkService extends ApiManager {
  final String getDrinkUrl = '/food/wine/recommendation';

  Future<DrinksModel> getDrinkService(
      {required int number, String? query}) async {
    final response = await getHttp(
      '$getDrinkUrl?wine=$query&number=$number',
    );
    return DrinksModel.fromJson(response.data);
  }
}
