// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:recipe_app/data/controllers/future_manager.dart';
// import 'package:recipe_app/data/provider/openai_provider.dart';
// import 'package:recipe_app/view_model/base_vm.dart';

// class OpenAiVm extends BaseViewModel {
//   OpenAiVm(Ref ref) : super(ref);

//   FutureManager<dynamic> askBotData = FutureManager();

//   Future<bool> getChatBotResponse({required String message}) async {
//     askBotData.load();
//     notifyListeners();
//     final response = await ref
//         .read(openAiServiceProvider)
//         .getChatBotResponseService(message: message);
//     if (response != null) {
//       askBotData.onSuccess("Success");
//       notifyListeners();
//       return true;
//     } else {
//       askBotData.onError("An error occured");
//       notifyListeners();
//       return false;
//     }
//   }
// }
