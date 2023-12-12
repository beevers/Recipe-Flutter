import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../view_model/drink/get_drink_vm.dart';
import '../../services/drink/get_drink_service.dart';

final getDrinkServiceProvider = Provider<GetDrinkService>((ref) {
  return GetDrinkService();
});

final getDrinkViewModel = ChangeNotifierProvider<GetDrinkVm>((ref) {
  return GetDrinkVm(ref);
});
