import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../model/article_details.dart';
import '../../shared/string_manager.dart';
import '../../widget/add_news.dart';
import '../../widget/widget_failure_message.dart';
import '../../widget/widget_item_news.dart';

class TopHeadlinesNewsResponseModel {
  final String status;
  final int totalResults;
  final List<ItemArticleTopHeadlinesNewsResponseModel> articles;

  TopHeadlinesNewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final refreshIndicatorState = GlobalKey<RefreshIndicatorState>();

  var indexCategorySelected = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFEFF5F5),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              color: Color(0xFFEFF5F5),
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            StringManager.appTitle,
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        AddNewsIcon()
                      ],
                    ),
                  ),
                  WidgetDateToday(),
                  SizedBox(height: 20.h),
                  WidgetCategoryNews(
                      listCategories: listCategories,
                      indexDefaultSelected: indexCategorySelected),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: _buildWidgetContentNewsAndroid(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetContentNewsAndroid() {
    var listArticles = realExampleArticles;
    return Stack(
      children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemBuilder: (context, index) {
            var itemArticle = listArticles[index];
            var dateTimePublishedAt = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
                .parse(itemArticle.publishedAt, true);
            var strPublishedAt =
                DateFormat('MMM dd, yyyy HH:mm').format(dateTimePublishedAt);
            // if (index == 0) {
            //   return _buildWidgetItemLatestNews(itemArticle, strPublishedAt);
            // } else {
            return _buildWidgetItemNews(index, itemArticle, strPublishedAt);
            // }
          },
          itemCount: listArticles.length,
        ),
      ],
    );
  }

  Widget _buildWidgetFailureLoadData() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WidgetFailureMessage(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[700],
            ),
            // onPressed: () {
            //   if (Platform.isIOS) {
            //     isLoadingCenterIOS = true;
            //     topHeadlinesNewsBloc.add(
            //       LoadTopHeadlinesNewsEvent(category: listCategories[indexCategorySelected].title.toLowerCase()),
            //     );
            //   } else {
            //     refreshIndicatorState.currentState.show();
            //   }
            // },
            onPressed: () {},
            child: Text(
              'Try Again'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetItemNews(
    int index,
    ItemArticleTopHeadlinesNewsResponseModel itemArticle,
    String strPublishedAt,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: WidgetItemNews(
        itemArticle: itemArticle,
        strPublishedAt: strPublishedAt,
      ),
    );
  }

  Widget _buildWidgetItemLatestNews(
    ItemArticleTopHeadlinesNewsResponseModel itemArticle,
    String strPublishedAt,
  ) {
    return GestureDetector(
      onTap: () async {
        // if (await canLaunch(itemArticle.url)) {
        //   await launch(itemArticle.url);
        // } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(StringManager.noDetails),
        ));
        // }
      },
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
              itemArticle.urlToImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.0),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              padding: EdgeInsets.all(8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.w,
                    ),
                    child: Text(
                      StringManager.latestNews,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    itemArticle.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        strPublishedAt,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        itemArticle.source.name,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetCategoryNews extends StatefulWidget {
  final List<CategoryNewsModel> listCategories;
  final int indexDefaultSelected;

  WidgetCategoryNews({
    required this.listCategories,
    required this.indexDefaultSelected,
  });

  @override
  _WidgetCategoryNewsState createState() => _WidgetCategoryNewsState();
}

class _WidgetCategoryNewsState extends State<WidgetCategoryNews> {
  late int indexCategorySelected;

  @override
  void initState() {
    indexCategorySelected = widget.indexDefaultSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var itemCategory = widget.listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 12.w,
              right: index == widget.listCategories.length - 1 ? 0 : 12.w,
            ),
            child: GestureDetector(
              onTap: () {
                if (indexCategorySelected == index) {
                  return;
                }
                // setState(() => indexCategorySelected = index);
                // var topHeadlinesNewsBloc = BlocProvider.of<TopHeadlinesNewsBloc>(context);
                // topHeadlinesNewsBloc.add(
                //   ChangeCategoryTopHeadlinesNewsEvent(indexCategorySelected: index),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: itemCategory.title.toLowerCase() == 'all'
                      ? const Color(0xFFBBCDDC)
                      : null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  image: itemCategory.title.toLowerCase() == 'all'
                      ? null
                      : DecorationImage(
                          image: AssetImage(
                            itemCategory.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                        indexCategorySelected == index ? 0.2 : 0.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: indexCategorySelected == index
                        ? Border.all(
                            color: Colors.white,
                            width: 2.0,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      itemCategory.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: widget.listCategories.length,
      ),
    );
  }
}

class WidgetDateToday extends StatefulWidget {
  @override
  _WidgetDateTodayState createState() => _WidgetDateTodayState();
}

class _WidgetDateTodayState extends State<WidgetDateToday> {
  late String strToday;

  @override
  void initState() {
    strToday = DateFormat('EEEE, MMM dd, yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        strToday,
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
