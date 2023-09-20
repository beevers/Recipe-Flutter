import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/services/open_ai_service.dart';
import 'package:recipe_app/view_model/openai_vm.dart';

final openAiServiceProvider = Provider<OpenAiService>((ref) {
  return OpenAiService();
});

final openAiViewModel = ChangeNotifierProvider<OpenAiVm>((ref) {
  return OpenAiVm(ref);
});
