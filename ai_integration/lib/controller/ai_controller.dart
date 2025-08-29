import 'package:flutter_application_1/model/ai_response_model.dart';
import 'package:flutter_application_1/service/ai_service.dart';

class AiController {
  final AiService _aiService = AiService();

  Future<String> fetchAnswer(String prompt) async {
    try {
      AiResponseModel aiResponseModel = await _aiService.fetchResponse(prompt);
      return aiResponseModel.reply;
    } catch (e) {
      return "Error: $e";
    }
  }
}
