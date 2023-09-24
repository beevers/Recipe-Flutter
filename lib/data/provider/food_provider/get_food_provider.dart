import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/services/food/get_food_service.dart';
import 'package:recipe_app/view_model/food/get_food_vm.dart';

final getFoodServiceProvider = Provider<GetFoodService>((ref) {
  return GetFoodService();
});

final getFoodViewModel = ChangeNotifierProvider<GetFoodViewModel>((ref) {
  return GetFoodViewModel(ref);
});
