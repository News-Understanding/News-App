import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_understanding/controller/text_controller.dart';
import 'package:news_understanding/shared/string_manager.dart';

class AddNewsIcon extends StatelessWidget {
  const AddNewsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNews(),
            ));
      },
      child: Icon(
        Icons.add,
        size: 25.w,
      ),
    );
  }
}

class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  @override
  Widget build(BuildContext context) {
    final textProvider = Modular.get<TextProvider>();
    // final textProvider = context.watch<TextProvider>();
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: TextField(
          onChanged: (value) {
            textProvider.changeText(value);
            print(textProvider.text);
          },
          controller: textProvider.textEditingController,
          maxLines: 7,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.sp),
            prefixIcon: const Icon(Icons.newspaper),
            hintText: StringManager.enterYourNew,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
            counter: Text(textProvider.text.length.toString()),
            filled: true,
            // Fill the background with a color
            fillColor: Colors.grey[200], // Background color
          ),
        ),
      )),
    );
  }
}
