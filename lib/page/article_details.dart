import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/classification_controller.dart';
import '../widget/add_news.dart';

const String article = '''
The Minister of Communications and Information Technology Amr Talaat has witnessed the graduation ceremony of the students of Digital Egypt Builders Initiative (DEBI), held in the Grand Celebration Hall at Cairo University, in the presence of representatives of international universities, ambassadors, representatives of local and global companies participating in DEBI, and graduates’ families.

The Initiative has been launched by the Ministry of Communications and Information Technology (MCIT) to grant a professional Master’s degree to 257 students in Artificial Intelligence (AI) and data science, digital arts, FinTech, robotics and automation, and cybersecurity, in cooperation with the University of Ottawa and Queen’s University in Canada, University College Cork (UCC) in Ireland, and Universiti Sains Malaysia (USM) in Malaysia.

During the ceremony, seven batches in various DEBI disciplines graduated, including 34 graduates of the 2022 Summer Class in AI and data science from the University of Ottawa; 55 graduates of the 2022 Fall Class in AI and data science from Queen’s University; 18 graduates of the 2023 Winter Class in digital arts from UCC; 48 graduates of the 2023 Winter Class in FinTech from USM; 61 graduates of the 2023 Winter Class in AI and data science from the University of Ottawa; 21 graduates of the 2023 Winter Class in robotics and automation from the University of Ottawa; and 20 graduates of the 2023 Winter Class in cybersecurity from the University of Ottawa.

DEBI graduates obtained a professional Master’s degree in their fields of specialization from the international universities they joined after successfully completing the study of their fields. This is in addition to the leadership and management skills program, and the English language and training program accredited by global and local companies participating in DEBI. They also delivered their graduation projects.

In his remarks, the ICT Minister underscored that graduating a new batch of DEBI is a breakthrough in building Digital Egypt, of which the Initiative is one of the most significant pillars. He stated that human development is one of the planks of Digital Egypt Strategy based on MCIT vision that countries’ progress is made by those investing in the capabilities of their youth to enhance knowledge, build capabilities, and leverage people’s creativity. The ICT Minister noted that DEBI is one of the most significant elements of MCIT human development initiatives.

Talaat added that the labor markets are changing increasingly, especially with the ICT challenges and opportunities, in light of the growing demand in the international and local labor market for specialists in tech sciences. He pointed out that jobs related to AI, Machine Learning (ML), cybersecurity, business technology, and digital arts are at the top of the list of the fastest growing jobs.

The ICT Minister highlighted that DEBI was initiated on the idea of partnership. He thanked the Ministry of Youth and Sports led by its Minister Ashraf Sobhy for providing accommodation for DEBI students, as well as international universities and global and local companies for partnering up with DEBI.

For her part, the Advisor to the ICT Minister for Technological Talents Hoda Baraka stated that DEBI targets, since its launch, students at the faculties of engineering, computers, information, science, and then expanded to include faculties of fine arts, applied arts, commerce, business administration, economics, and management information systems, with a total of nine specialized faculties. DEBI also aims to add new tracks to include other faculties, she added.

Baraka stated that the number of students enrolled in DEBI amounted to 625 students, with 109 graduated in 2021, 257 graduated in 2022, and 259 students enrolled during the academic year 2022-2023, in cooperation with the University of Ottawa and Queen’s University in Canada, USM in Malaysia, and UCC in Ireland.

During the graduation ceremony, Talaat handed over prizes to the winners of the DEBI Robotics Challenge 2023 launched by MCIT, in collaboration with Huawei and Egypt University of Informatics (EUI) for students at the faculties of engineering, and computers from all Egyptian universities.

In a similar vein, the ICT Minister honored 31 agencies and companies of DEBI partners, during the graduation ceremony, in appreciation of their efforts to upskill DEBI youth. These agencies and companies include the Central Bank of Egypt (CBE), the Information Technology Industry Development Agency (ITIDA), Telecom Egypt, Egypt Post, the National Telecommunication Institute (NTI), the Egyptian Computer Emergency Readiness Team (EG-CERT) of the National Telecom Regulatory Authority (NTRA), the Applied Innovation Center (AIC), the National Museum of Egyptian Civilization (NMEC), the Child Museum, the National Bank of Egypt (NBE), Arab African International Bank (AAIB), Commercial International Bank (CIB), Cisco, IBM, Fortinet, Autodesk, Microsoft, Google, VMware, Amazon Web Services (AWS), Dell Technologies, Huawei Technologies, Valeo, Vodafone, Udacity, Dale Carnegie, Berlitz, Al Ahly Momkn for e-payment, Fawry, WUZZUF, Synapse Analytics, and 5dVR.

The graduation ceremony was attended by the Ambassador Extraordinary and Plenipotentiary of Malaysia to Egypt Zamani bin Ismail, the Counsellor and Senior Trade Commissioner at the Embassy of Canada to Egypt G. Mark Scullion, UCC Head Chris Williams, Vice President for Education and Student Affairs at Cairo University Gamal El-Shazly, Vice-Provost of Queen’s University Sandra den Otter, the Dean of the Faculty of Engineering at the University of Ottawa Jacques Beauvais, and USM Vice-Chancellor Abdul Rahman Mohamed.

It is noteworthy that DEBI is a scholarship launched by MCIT to grant a professional Master’s degree in one of the following majors: Data Science and AI; Cybersecurity; Robotics and Automation; Digital Arts; and Fintech, in collaboration with top-notch international universities.

MCIT, within DEBI, collaborates with several local and global companies specializing in ICT to help learners gain hands-on experience, as well as with leading companies and institutions to develop the students’ leadership, soft, and language skills.

Admission to DEBI new academic year 2023-2024 in all DEBI tracks will open by the end of June through DEBI website''';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  bool isSummarized = false;

  @override
  Widget build(BuildContext context) {
    final clfProvider = context.watch<ClassificationProvider>();
    TextStyle myTextStyle = TextStyle(color: Theme.of(context).primaryColor
        // Add more common styling properties here
        );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1- The photo of the news
              Container(
                height: 250,
                width: double.infinity,
                child: Image.asset("assets/images/debi.jpg"),
              ),

              // 2- Title of the article
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'ICT Minister Attends DEBI Graduation Ceremony',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // 3- Author info and timestamp
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/75434006?s=400&u=b70e4e45b60ae3711d1ce6418816d9d4f0ce71e7&v=4'),
                          // Replace with actual image
                          radius: 20,
                        ),
                        SizedBox(width: 8),
                        Text('by Anas Ibrahim'),
                      ],
                    ),
                    Text('1 hr ago'),
                  ],
                ),
              ),

              // 4- Like, Comment, Share
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.comment),
                        SizedBox(width: 4),
                        Text('10 comments'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(width: 4),
                        Text('8 likes'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 4),
                        Text('Share'),
                      ],
                    ),
                  ],
                ),
              ),
              if (clfProvider.isLoading != null &&
                  clfProvider.isLoading == false)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          clfProvider.classificationResult?.topic ?? "Tech",
                          style: myTextStyle,
                        ),
                        Text(
                          clfProvider.classificationResult?.sentiment ??
                              "Positive",
                          style: myTextStyle,
                        ),
                        Text(
                          clfProvider.classificationResult?.bias ?? "Un-Biased",
                          style: myTextStyle,
                        ),
                        Text(
                          clfProvider.classificationResult?.fake ?? "fake",
                          style: myTextStyle,
                        ),
                      ]),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (clfProvider.isLoading == null)
                    TextButton(
                      onPressed: () async {
                        clfProvider.setLoading();
                        await clfProvider.classifyText(
                          article,
                        );
                      },
                      child: Text('Classify',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  if (clfProvider.isLoading == true)
                    Lottie.asset(
                      "assets/lottie/load2.json",
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (clfProvider.isLoadingSummarize == true)
                    Lottie.asset(
                      "assets/lottie/load2.json",
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                  if (clfProvider.isLoadingSummarize != true)
                  TextButton(
                    onPressed: () async {
                      if (clfProvider.isLoadingSummarize == null) {
                        clfProvider.setSummarizeLoading();
                        await clfProvider.summarizeText(article);
                      }
                      if (clfProvider.isLoadingSummarize == false) {
                        Future.delayed(
                          Duration.zero,
                          () {
                            var dialog = showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  key: ObjectKey(isSummarized),
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 320,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
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
                                                    isSummarized = true;
                                                  });
                                                },
                                                onFinished: () {
                                                  setState(() {
                                                    isSummarized = true;
                                                  });
                                                },
                                                isRepeatingAnimation: false,
                                                displayFullTextOnTap: true,
                                                animatedTexts: [
                                                  TypewriterAnimatedText(
                                                      clfProvider.summarized ??
                                                          ""),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        if (isSummarized)
                                          NumberWord(
                                              number: clfProvider.summarized!
                                                  .split(" ")
                                                  .length,
                                              key: ValueKey(isSummarized))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Summarize',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              // 5- News article that can scroll

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(
                    article,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              // 6- Buttons for classification and summarization
            ],
          ),
        ),
      ),
    );
  }
}
