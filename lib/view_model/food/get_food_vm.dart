import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/data/provider/food_provider/get_food_provider.dart';
import 'package:recipe_app/model/food/get_food_model.dart';
import 'package:recipe_app/view_model/base_vm.dart';

class GetFoodViewModel extends BaseViewModel {
  GetFoodViewModel(super.ref);

  FutureManager<FoodModel> getFoodData = FutureManager();

  Future<bool> getFood({required int number, String? query}) async {
    getFoodData.load();
    notifyListeners();
    final result = await ref
        .read(getFoodServiceProvider)
        .getFoodService(number: number, query: query);
    if (result.limit != null) {
      getFoodData.onSuccess(result);
      notifyListeners();
      return true;
    } else {
      getFoodData.onError("An Error occured");
      notifyListeners();
      return false;
    }
  }
}
