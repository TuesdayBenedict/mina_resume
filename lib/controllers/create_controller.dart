import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  final prompt = TextEditingController();
  final RxString response = ''.obs;
  final RxBool loading = false.obs;

  static const String _apiKey = 'AIzaSyAAih9ggX744QHVawvOdYyZSVwccixE0cM';
  static const String _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent';

  Future<void> parseResumeWithGemini() async {
    loading.value = true;
    response.value = '';

    try {
      final res = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': _apiKey,
        },
        body: jsonEncode({
          "contents": [
            {
              "role": "user",
              "parts": [
                {"text": _resumePrompt(prompt.text)},
              ],
            },
          ],
          "generationConfig": {
            "temperature": 0.2,
            "responseMimeType": "application/json",
          },
        }),
      );

      if (res.statusCode != 200) {
        response.value = 'HTTP ${res.statusCode}: ${res.body}';
        return;
      }

      final data = jsonDecode(res.body);

      response.value = data['candidates'][0]['content']['parts'][0]['text'];
    } catch (e) {
      response.value = 'Error: $e';
    } finally {
      loading.value = false;
    }
  }

  String _resumePrompt(String resumeText) {
    return '''
You are a professional resume parsing engine.

STRICT RULES:
- Output ONLY valid JSON
- No markdown
- No explanations
- Do NOT include null text outside JSON

Return the following schema:

$resumeSchema

Resume content:
$resumeText
''';
  }

  final Map resumeSchema = {
    "basics": {
      "fullName": "",
      "headline": "",
      "email": "",
      "phone": "",
      "location": {"city": "", "country": ""},
      "links": {"linkedin": "", "github": "", "portfolio": ""},
    },
    "summary": "",
    "skills": {"technical": [], "soft": [], "tools": []},
    "experience": [
      {
        "jobTitle": "",
        "company": "",
        "location": "",
        "startDate": "",
        "endDate": "",
        "isCurrent": false,
        "responsibilities": [],
        "achievements": [],
      },
    ],
    "education": [
      {
        "degree": "",
        "institution": "",
        "location": "",
        "startYear": "",
        "endYear": "",
      },
    ],
    "certifications": [],
    "projects": [
      {"name": "", "description": "", "technologies": [], "link": ""},
    ],
    "languages": [],
    "interests": [],
  };
}
