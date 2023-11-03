import 'package:flutter/foundation.dart';

import '../api/api_classification.dart';
import '../model/fake_classification_model.dart';

class ClassificationProvider extends ChangeNotifier {
  ClassificationResult? _classificationResult;

  ClassificationResult? get classificationResult => _classificationResult;
  bool isLoading = true;

  Future<void>  classifyText(String text) async {
    try {
      _classificationResult = await Api.classifyText(text);
      isLoading=false;
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}