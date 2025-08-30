import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/ai_response_model.dart';

class AiService {
  static const String _apiKey = "AIzaSyChHe6jBPAvCSYDOx-mSpk7-V37xO1Cgys";
  // Updated endpoint - use generateContent instead of generateText
  static const String _endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini:generateContent";

  Future<AiResponseModel> fetchResponse(String prompt) async {
    final response = await http.post(
      Uri.parse("$_endpoint?key=$_apiKey"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Updated response parsing for generateContent endpoint
      final generatedText = data['candidates'][0]['content']['parts'][0]['text'];
      return AiResponseModel.fromJson({"response": generatedText});
    } else {
      log("${response.statusCode}");
      log("$_endpoint?key=$_apiKey");
      log("${response.body}");
      throw Exception("Fetching Failed: ${response.statusCode}");
    }
  }
}