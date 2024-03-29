import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_understanding/controller/text_controller.dart';
import 'package:news_understanding/page/home/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/classification_controller.dart';
import 'controller/home_provider.dart';

void main() async {
  // final model = await Interpreter.fromAsset("assets/pytorch_model.bin");

  // Convert the model to a TensorFlow Lite format.
  // final tfliteModel = await Interpreter.fromModel(model).convert();

  // Save the TensorFlow Lite model.
  // await tfliteModel.saveToFile('tflite_model.tflite');
  await ScreenUtil.ensureScreenSize();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClassificationProvider>(
          create: (context) => ClassificationProvider(),
        ),
        ChangeNotifierProvider<TextProvider>(
          create: (context) => TextProvider(),
        ),  ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Smart App',
          theme: ThemeData(
            // primarySwatch: Colors.orange,
            primaryColor: Colors.indigo,
            focusColor: Colors.indigoAccent,

            textTheme: GoogleFonts.alikeTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const HomePage(),
        ),
      ),
    ); //added by extension
  }
}
