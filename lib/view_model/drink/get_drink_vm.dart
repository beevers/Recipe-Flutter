import 'package:recipe_app/data/controllers/future_manager.dart';
import 'package:recipe_app/model/drinks/get_drink_model.dart';
import 'package:recipe_app/view_model/base_vm.dart';

import '../../data/provider/drink_provider/get_drink_provider.dart';

class GetDrinkVm extends BaseViewModel {
  GetDrinkVm(super.ref);

  FutureManager<DrinksModel> getDrinkData = FutureManager();

  Future<bool> getDrink({required int number, required String query}) async {
    getDrinkData.load();
    notifyListeners();
    final response = await ref
        .read(getDrinkServiceProvider)
        .getDrinkService(number: number, query: query);
    if (response.recommendedWines != null) {
      getDrinkData.onSuccess(response);
      return true;
    } else {
      getDrinkData.onError('Could not get drink');
      return false;
    }
  }
}
