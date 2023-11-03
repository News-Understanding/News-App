import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier{

  TextEditingController textEditingController = TextEditingController();
  String _text = '';

  String get text => _text;

  void changeText (value){
    _text = value;
    notifyListeners();
  }
}