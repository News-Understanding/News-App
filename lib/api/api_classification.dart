import 'package:dio/dio.dart';
import 'dart:convert';

import '../model/fake_classification_model.dart';

class Api {
  static Future<ClassificationResult> classifyText(String text) async {
    var dio = Dio();

    try {
      var response = await dio.post(
        'http://192.168.70.10:5000/fake',
        data: jsonEncode(<String, String>{
          'text': text,
        }),
      );

      if (response.statusCode == 200) {
        return ClassificationResult.fromJson(jsonDecode(response.data));
      } else {
        throw Exception('Failed to classify text.');
      }
    } catch (e) {
      throw Exception('Failed to classify text: $e');
    }
  }
}
