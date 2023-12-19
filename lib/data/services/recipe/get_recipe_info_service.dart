import 'package:recipe_app/data/api/api_manager.dart';
import 'package:recipe_app/model/recipe/get_recipe_info_model.dart';

class GetRecipeInfoSerive extends ApiManager {
  final String getRecipeInfoUrl = '/recipes/';

  Future<GetRecipeInfoModel> getRecipeInfo({required String id}) async {
    final response = await getHttp(
      "$getRecipeInfoUrl$id/information",
    );
    return GetRecipeInfoModel.fromJson(response.data);
  }
}
