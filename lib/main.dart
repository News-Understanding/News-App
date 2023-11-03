import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_understanding/controller/text_controller.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'app_module.dart';
import 'package:provider/provider.dart';

import 'controller/classification_controller.dart';

void main() async {
  // final model = await Interpreter.fromAsset("assets/pytorch_model.bin");

  // Convert the model to a TensorFlow Lite format.
  // final tfliteModel = await Interpreter.fromModel(model).convert();

  // Save the TensorFlow Lite model.
  // await tfliteModel.saveToFile('tflite_model.tflite');
  await ScreenUtil.ensureScreenSize();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'My Smart App',
        theme: ThemeData(primarySwatch: Colors.grey),
        routerConfig: Modular.routerConfig,
      ),
    ); //added by extension
  }
}