import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_understanding/controller/home_provider.dart';
import 'package:provider/provider.dart';

import '../model/article_details.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  bool isLogin = false;

  Future<String?>? _authUser(LoginData data) {
    return null;
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? AddPost()
        : FlutterLogin(
            title: 'Discover',

            theme: LoginTheme(
                primaryColor: Theme.of(context).primaryColor,
                pageColorDark: Theme.of(context).primaryColor,
                pageColorLight: Theme.of(context).focusColor,
                cardTheme: const CardTheme(
                  color: Colors.white,
                  elevation: 0,
                )),

            // logo: const AssetImage('assets/images/ecorp-lightblue.png'),
            onLogin: _authUser,
            onSignup: _signupUser,

            onSubmitAnimationCompleted: () {
              setState(() {
                isLogin = true;
              });
            },
            onRecoverPassword: _recoverPassword,
          );
  }
}

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController headingController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController articleController = TextEditingController();
  XFile? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Pick Image"),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context,
                    await picker.pickImage(source: ImageSource.gallery));
              },
              child: const Text('Pick from Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context,
                    await picker.pickImage(source: ImageSource.camera));
              },
              child: const Text('Take a Photo'),
            ),
          ],
        );
      },
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);

      setState(() {
        selectedImage = XFile(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Center(
                        child: selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                  File(selectedImage!.path),
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              )
                            : const Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.grey,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: headingController,
                    decoration: const InputDecoration(
                      labelText: 'Heading',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: tagController,
                    decoration: const InputDecoration(
                      labelText: 'Tag',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.label),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TextField(
                      controller: articleController,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        labelText: 'News Article',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.article),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ItemArticleTopHeadlinesNewsResponseModel article4 =
                ItemArticleTopHeadlinesNewsResponseModel(
                  source: ItemSourceTopHeadlinesNewsResponseModel(
                    name: 'The New York Times',
                  ),
                  author: 'Alice Johnson',
                  title:
                  'ICT Minister Attends DEBI Graduation Ceremony',
                  description:'''
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

Admission to DEBI new academic year 2023-2024 in all DEBI tracks will open by the end of June through DEBI website''',
                  url: 'https://d1b3667xvzs6rz.cloudfront.net/2021/01/128543748_3589784384394299_6311095176158318460_o.jpg',
                  topic: "Business",
                  sentiment: "Positive",
                  isFake: "Real",
                  bais: 'Un-Bais',
                  urlToImage:
                  'https://d1b3667xvzs6rz.cloudfront.net/2021/01/128543748_3589784384394299_6311095176158318460_o.jpg',
                  publishedAt: '2023-10-30T10:45:00Z',
                  content:
                  'The global climate conference brought together leaders from around the world...',
                );
                realExampleArticles.add(article4);
                context.read<HomeProvider>().setVisit(0);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor),
              child: const Text(
                'Publish',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
