import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../model/article_details.dart';
import '../../widget/widget_failure_message.dart';
import '../../widget/widget_item_news.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controllerKeyword = TextEditingController();
  final focusNodeIconSearch = FocusNode();
  late String keyword;
  Timer? debounce;

  @override
  void initState() {
    keyword = '';
    controllerKeyword.addListener(_onSearching);
    super.initState();
  }

  @override
  void dispose() {
    focusNodeIconSearch.dispose();
    controllerKeyword.removeListener(_onSearching);
    controllerKeyword.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var theme = Theme.of(context);
    var isDarkTheme = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: isDarkTheme ? null : Color(0xFFEFF5F5),
          ),
          SafeArea(
            child: Container(
              color: isDarkTheme ? null : Color(0xFFEFF5F5),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 48.w,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 36.w),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  controller: controllerKeyword,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Searching something?',
                                    hintStyle: TextStyle(
                                      fontSize: 36.sp,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 36.sp,
                                  ),
                                ),
                              ),
                              Hero(
                                tag: 'iconSearch',
                                child: Focus(
                                  focusNode: focusNodeIconSearch,
                                  child: Icon(
                                    Icons.search,
                                    size: 48.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var itemArticle = realExampleArticles[index];
                        var dateTimePublishedAt =
                            DateFormat('yyyy-MM-ddTHH:mm:ssZ')
                                .parse(itemArticle.publishedAt, true);
                        var strPublishedAt = DateFormat('MMM dd, yyyy HH:mm')
                            .format(dateTimePublishedAt);
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: WidgetItemNews(
                            itemArticle: itemArticle,
                            strPublishedAt: strPublishedAt,
                          ),
                        );
                      },
                      itemCount: realExampleArticles.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSearching() {
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(Duration(milliseconds: 800), () {
      var keyword = controllerKeyword.text.trim();
      if (keyword.isEmpty || this.keyword == keyword) {
        return;
      }
      this.keyword = keyword;
      focusNodeIconSearch.requestFocus();
      // topHeadlinesNewsBloc.add(SearchTopHeadlinesNewsEvent(keyword: keyword));
    });
  }
}
