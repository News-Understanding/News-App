import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isSummarized = false;
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // TextField(
                        //   controller: textProvider.titleController,
                        //   maxLines: 2,
                        //   decoration: InputDecoration(
                        //     contentPadding: EdgeInsets.all(16.sp),
                        //     prefixIcon: const Icon(Icons.title),
                        //     hintText: StringManager.enterYourTitle,
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10.0.sp),
                        //     ),
                        //     filled: true,
                        //     // Fill the background with a color
                        //     fillColor: Colors.grey[200], // Background color
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        TextField(
                          controller: textProvider.textEditingController,
                          maxLines: 8,
                          onChanged: (value) {
                            setState(() {

                            });
                          },

                          decoration: InputDecoration(
                            labelText: StringManager.newsArticle,
                            labelStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(16.sp),
                            prefixIcon: const Icon(Icons.newspaper),
                            hintText: StringManager.enterYourNew,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.sp),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200], // Background color
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        NumberWord(
                          number: textProvider.textEditingController.text.trimRight()
                              .split(" ")
                              .length,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonsPost(
                        clfProvider: clfProvider, textProvider: textProvider),
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
                            ),
                        ],
                      ),
                    SizedBox(height: 10.sp),
                    if (clfProvider.isLoadingSummarize != null)
                      Column(
                        children: [
                          if (clfProvider.isLoadingSummarize!)
                            Lottie.asset(
                              "assets/lottie/load2.json",
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          if (!clfProvider.isLoadingSummarize!)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueGrey.shade200,
                                  ),
                                  padding: EdgeInsets.all(8.sp),
                                  child: SingleChildScrollView(
                                    child: DefaultTextStyle(
                                      style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                      child: AnimatedTextKit(
                                        onTap: () {
                                          setState(() {
                                            isSummarized =true;
                                          });
                                        },
                                        onFinished: () {
                                          setState(() {
                                            isSummarized =true;
                                          });
                                        },
                                        isRepeatingAnimation: false,
                                        displayFullTextOnTap: true,
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                              clfProvider.summarized ?? ""),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                if(isSummarized)
                                NumberWord(
                                  number:
                                      clfProvider.summarized!.split(" ").length,
                                )
                              ],
                            ),
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

class ButtonsPost extends StatelessWidget {
  const ButtonsPost({
    super.key,
    required this.clfProvider,
    required this.textProvider,
  });

  final ClassificationProvider clfProvider;
  final TextProvider textProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp)),
              backgroundColor: Colors.grey.shade400),
          onPressed: () async {
            clfProvider.setLoading();
            await clfProvider.classifyText(
              textProvider.textEditingController.text,
            );
          },
          child: const Text(
            StringManager.publish,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp)),
              backgroundColor: Colors.grey.shade400),
          onPressed: () async {
            clfProvider.setSummarizeLoading();
            await clfProvider
                .summarizeText(textProvider.textEditingController.text);
          },
          child: const Text(
            StringManager.summarize,
          ),
        ),
      ],
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
                pieTouchData: PieTouchData(enabled: true),

                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                    title: clfProvider.classificationResult?.bias ?? "Un-Biased",
                    color: clfProvider.classificationResult?.bias == "Biased"
                        ? Colors.red
                        : Colors.green,
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
                    color: clfProvider.classificationResult?.sentiment ==
                            "Positive"
                        ? Colors.green
                        : clfProvider.classificationResult?.sentiment ==
                                "Negative"
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
        const SizedBox(
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

class NumberWord extends StatelessWidget {
  final int number;

  const NumberWord({super.key, this.number = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "$number Words",
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ));
  }
}
