import 'package:dio/dio.dart';
import 'dart:convert';

import '../model/fake_classification_model.dart';

class Api {
  static Future<Classification> classifyText(String text) async {
    var dio = Dio();

    try {
      var response = await dio.post(
        'http://192.168.70.10:5000/fake',
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
}