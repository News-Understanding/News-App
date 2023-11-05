import 'package:flutter/foundation.dart';

import '../api/api_classification.dart';
import '../model/fake_classification_model.dart';

class ClassificationProvider extends ChangeNotifier {
  Classification? _classificationResult;
  String? _summarized ;

  String? get summarized => _summarized;

  Classification? get classificationResult => _classificationResult;
  bool? isLoading ;
  bool? isLoadingSummarize ;

  void setLoading (){
    isLoading = true;
    notifyListeners();
  }
  void setSummarizeLoading (){
    isLoadingSummarize = true;
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
  Future<void> summarizeText(String text) async {
    try {
      _summarized = await Api.summarizeText(text);
      isLoadingSummarize = false;
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
