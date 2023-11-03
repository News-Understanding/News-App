import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_understanding/controller/classification_controller.dart';
import 'package:news_understanding/controller/text_controller.dart';
import 'package:news_understanding/shared/string_manager.dart';
import 'package:provider/provider.dart';

import 'Indicator.dart';

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
    final textProvider = context.watch<TextProvider>();
    final clfProvider = context.watch<ClassificationProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              child: Image.asset("assets/images/background2.jpg")),
          Center(
              child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        TextField(
                          controller: textProvider.titleController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.sp),
                            prefixIcon: const Icon(Icons.title),
                            hintText: StringManager.enterYourTitle,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.sp),
                            ),
                            filled: true,
                            // Fill the background with a color
                            fillColor: Colors.grey[200], // Background color
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: textProvider.textEditingController,
                          maxLines: 7,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.sp),
                            prefixIcon: const Icon(Icons.newspaper),
                            hintText: StringManager.enterYourNew,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.sp),
                            ),
                            filled: true,
                            // Fill the background with a color
                            fillColor: Colors.grey[200], // Background color
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(12.sp),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)

                     ),
                        backgroundColor: Colors.grey.shade400

                      ),
                      onPressed: () async {
                        clfProvider.setLoading();
                        await clfProvider.classifyText(
                            textProvider.textEditingController.text);
                      },
                      child: const Text(StringManager.publish,

                      ),
                    ),
                    if (clfProvider.isLoading != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          if (clfProvider.isLoading!)
                            Lottie.asset(
                              "assets/lottie/load2.json",
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          if (!clfProvider.isLoading!)
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blueGrey.shade200,
                              ),
                              padding: EdgeInsets.all(8.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Pie(clfProvider: clfProvider),
                                    ),
                                  ),
                                  const Indicators(),
                                ],
                              ),
                            )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class Pie extends StatelessWidget {
  const Pie({
    super.key,
    required this.clfProvider,
  });

  final ClassificationProvider clfProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(enabled: true ),
                sectionsSpace: 2, sections: [
              PieChartSectionData(
                title: "Un-bias",
                // color: clfProvider.classificationResult?.=="fake"?Colors.red:Colors.green,
                titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [BoxShadow(color: Colors.black)]),
              ),
              // PieChartSectionData(
              //   title: clfProvider.classificationResult?.topic,
              //   color: const Color(0xff2E69E0),
              //   titleStyle: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       shadows: [
              //         BoxShadow(
              //           color: Colors.black,
              //         )
              //       ]),
              // ),
              PieChartSectionData(
                title: clfProvider.classificationResult?.sentiment,
                color: clfProvider.classificationResult?.sentiment == "Positive"
                    ? Colors.green
                    : clfProvider.classificationResult?.sentiment == "Negative"
                        ? Colors.red
                        : Colors.blue,
                titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [BoxShadow(color: Colors.black)]),
              ),
              PieChartSectionData(
                color: clfProvider.classificationResult?.fake == "fake"
                    ? Colors.red
                    : Colors.green,
                titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [BoxShadow(color: Colors.black)]),
                title: clfProvider.classificationResult?.fake,
              ),
            ]),
            swapAnimationDuration: const Duration(milliseconds: 150),
            // Optional
            swapAnimationCurve: Curves.linear,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          clfProvider.classificationResult!.topic,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        )
      ],
    );
  }
}

class Indicators extends StatelessWidget {
  const Indicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Indicator(
          color1: Colors.red,
          color2: Colors.green,
          text: 'Fake/Real',
          isSquare: true,
        ),
        SizedBox(height: 4),
        Indicator(
          color1: Colors.red,
          color2: Colors.green,
          text: 'Sentiment',
          isSquare: true,
        ),
        // SizedBox(
        //   height: 4,
        // ),
        // Indicator(
        //   color1: Colors.red,
        //   color2: Colors.green,
        //   text: 'Topic',
        //   isSquare: true,
        // ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color1: Colors.red,
          color2: Colors.green,
          text: 'Bias/Un-Bias',
          isSquare: true,
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
