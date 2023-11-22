import 'package:get_it/get_it.dart';

class InjectRiverPod {
  bool serverErrorOccur({bool confirm = false}) {
    return confirm;
  }
}

final locator = GetIt.instance;

void injectDependency() {
  locator.registerSingleton<InjectRiverPod>(InjectRiverPod());
}
