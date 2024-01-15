import 'package:dio/dio.dart';
import 'dart:convert';

import '../model/fake_classification_model.dart';

class Api {
  static Future<Classification> classifyText(String text) async {
    var dio = Dio();

    try {
      var response = await dio.post(
        'https://e74e-41-33-218-54.ngrok-free.app/fake',
        data: jsonEncode(<String, String>{
          'text': text,
        }),
      );
      Classification classification = Classification.fromJson(response.data);

      return classification;
    } catch (e) {
      throw Exception('Failed to classify text: $e');
    }
  }
  static Future<String> summarizeText(String text) async {
    var dio = Dio();

    try {
      var response = await dio.post(
        'https://e74e-41-33-218-54.ngrok-free.app/summarize',
        data: jsonEncode(<String, String>{
          'text': text,
        }),
      );


      return response.data.toString();
    } catch (e) {
      throw Exception('Failed to classify text: $e');
    }
  }
}