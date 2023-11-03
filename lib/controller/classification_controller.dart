import 'package:flutter/foundation.dart';

import '../api/api_classification.dart';
import '../model/fake_classification_model.dart';

class ClassificationProvider extends ChangeNotifier {
  Classification? _classificationResult;

  Classification? get classificationResult => _classificationResult;
  bool? isLoading ;

  void setLoading (){
    isLoading = true;
    notifyListeners();
  }

  Future<void> classifyText(String text) async {
    try {
      _classificationResult = await Api.classifyText(text);
      isLoading = false;
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
