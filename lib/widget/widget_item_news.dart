import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/article_details.dart';
import '../page/article_details.dart';
import '../page/home/home_page.dart';

class WidgetItemNews extends StatelessWidget {
  final ItemArticleTopHeadlinesNewsResponseModel itemArticle;
  final String strPublishedAt;

  WidgetItemNews({
    required this.itemArticle,
    required this.strPublishedAt,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ArticleDetails();
          },
        ));
      },
      child: SizedBox(
        height: 85.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: itemArticle.urlToImage,
                fit: BoxFit.cover,
                width: 100.w,
                height: 100.w,
                errorWidget: (context, url, error) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/img_not_found.jpg',
                      fit: BoxFit.cover,
                      width: 200.w,
                      height: 200.w,
                    ),
                  );
                },
                placeholder: (context, url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/img_placeholder.jpg',
                      fit: BoxFit.cover,
                      width: 250.w,
                      height: 250.w,
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 24.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      itemArticle.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Anas Ibrahim",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Text("1 hr ago"),
                    ],
                  )
                  // Wrap(
                  //   spacing: 8.0, // gap between adjacent chips
                  //   runSpacing: 4.0, // gap between lines
                  //   children: <Widget>[
                  //     Chip(
                  //       label: Text(itemArticle.sentiment),
                  //       avatar: CircleAvatar(
                  //         backgroundColor: Colors.green.shade800,
                  //         child: Text('S'),
                  //       ),
                  //     ),
                  //     Chip(
                  //       label: Text(itemArticle.bais),
                  //       avatar: CircleAvatar(
                  //         backgroundColor: Colors.blue.shade800,
                  //         child: Text('B'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // itemArticle.author == null
                  //     ? Container()
                  //     : Text(
                  //         itemArticle.author,
                  //         style: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 14.sp,
                  //         ),
                  //       ),
                  //
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: <Widget>[
                  //     Text(
                  //       strPublishedAt,
                  //       style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  //     ),
                  //     Text(
                  //       ' | ',
                  //       style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  //     ),
                  //     Text(
                  //       itemArticle.source.name,
                  //       style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
