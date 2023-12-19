import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/services/recipe/get_recipe_info_service.dart';

import '../../../view_model/recipe/get_recipe_info_vm.dart';

final getRecipeInfoServiceProvider = Provider<GetRecipeInfoSerive>((ref) {
  return GetRecipeInfoSerive();
});

final getRecipeInfoVmProvider = ChangeNotifierProvider<GetRecipeVm>((ref) {
  return GetRecipeVm(ref);
});
