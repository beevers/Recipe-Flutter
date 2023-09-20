import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_app/data/api/api_manager.dart';
import 'package:recipe_app/model/chat_bot_model/open_ai_model.dart';

class OpenAiService extends ApiManager {
  final String openaiUrl = 'https://api.openai.com/v1/completions';

  Future<OpenAiResponseModel> getChatBotResponseService(
      {required String message}) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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'
    };
    Map<String, dynamic> payload = {
      "model": "davinci",
      "prompt": message,
      "max_tokens": 250,
      "temperature": 0,
      "top_p": 1,
      // "n": 1,
      // "stream": false,
      // "logprobs": null,
      // "stop": ["\n", " Human:", " AI:"]
    };
    final response = await postHttp(openaiUrl, payload);
    print(response.data);
    return OpenAiResponseModel.fromJson(response.data);
  }
}
