import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/utils/inject_server_err_chck_utils.dart';

final locator = GetIt.instance;

void injectDependency() {
  locator.registerSingleton<InjectServerErrorCheck>(InjectServerErrorCheck());
}
