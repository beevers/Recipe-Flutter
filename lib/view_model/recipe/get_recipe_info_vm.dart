import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/data/provider/recipe_provider/get_recipe_info_provider.dart';
import 'package:recipe_app/model/recipe/get_recipe_info_model.dart';
import 'package:recipe_app/view_model/base_vm.dart';

class GetRecipeVm extends BaseViewModel {
  GetRecipeVm(super.ref);

  FutureManager<GetRecipeInfoModel> getRecipeInfoData = FutureManager();

  Future<bool> getRecipeInfo({required String id}) async {
    getRecipeInfoData.load();
    final response =
        await ref.read(getRecipeInfoServiceProvider).getRecipeInfo(id: id);
    if (response.title != null) {
      getRecipeInfoData.onSuccess(response);
      return true;
    } else {
      getRecipeInfoData.onError('Unable to get recipe info');
      return false;
    }
  }
}
