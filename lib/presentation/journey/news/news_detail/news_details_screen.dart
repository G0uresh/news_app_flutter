import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/constants/layout_constants.dart';
import 'package:news_app/common/theme/theme_color.dart';
import 'package:news_app/common/theme/theme_text.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';
import 'package:news_app/presentation/journey/news/headlines_list/headlines_list_constants.dart';
import 'package:news_app/presentation/widgets/network_image_widget/network_image_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  final HeadlinesNewsArticleDetailsEntity? headlinesNewsModel;

  const NewsDetailsScreen({Key? key, required this.headlinesNewsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag:
                '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineImageTag}',
            child: NetworkImageWidget(
              width: double.infinity,
              height: ScreenUtil().screenHeight,
              imageUrl: headlinesNewsModel?.urlToImage ?? '',
            ),
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil().screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
            padding: EdgeInsets.only(
                bottom: LayoutConstants.dimen_12.h,
                left: LayoutConstants.dimen_24.w,
                right: LayoutConstants.dimen_24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag:
                      '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineTitleTag}',
                  child: Text(
                    headlinesNewsModel?.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 29.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: LayoutConstants.dimen_64.h,
                      bottom: LayoutConstants.dimen_16.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                          tag:
                              '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineSourceTag}',
                          child: Text(
                            headlinesNewsModel?.sourceName ?? '',
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColor.lightGrey,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: LayoutConstants.dimen_8.w),
                        child: Hero(
                          tag:
                              '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlinePublishedTag}',
                          child: Text(
                            headlinesNewsModel?.publishedDate ?? '',
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColor.lightGrey,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                    headlinesNewsModel?.description ?? '',
                    style: Theme.of(context).textTheme.description,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            top: 36.h,
            child: Container(
              height: LayoutConstants.dimen_42.h,
              width: LayoutConstants.dimen_42.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.blackTransparent),
              child: Center(
                child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColor.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
