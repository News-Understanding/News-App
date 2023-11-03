import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_understanding/page/home/home_page.dart';
import 'package:news_understanding/widget/add_news.dart';

import 'SecondPage.dart';
import 'controller/text_controller.dart';
import 'home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<TextProvider>(TextProvider.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) =>  HomePage(),children: [
      ChildRoute('/page1', child: (context) => InternalPage(title: 'page 1', color: Colors.red)),
      ChildRoute('/page2', child: (context) => InternalPage(title: 'page 2', color: Colors.amber)),
      ChildRoute('/page3', child: (context) => InternalPage(title: 'page 3', color: Colors.green)),
    ]);
    r.child('/second', child: (context) =>  SecondPage(person: r.args.data,));
    r.child('/addNews', child: (context) =>  AddNews());



  }
}
class InternalPage extends StatelessWidget {
  final String title;
  final Color color;
  const InternalPage({Key? key, required this.title, required this.color}) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(child: Text(title)),
    );
  }
}