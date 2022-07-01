import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/constants/layout_constants.dart';
import 'package:news_app/common/theme/theme_color.dart';
import 'package:news_app/common/theme/theme_text.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';
import 'package:news_app/presentation/journey/news/headlines_list/headlines_list_constants.dart';
import 'package:news_app/presentation/journey/news/news_detail/news_details_screen.dart';
import 'package:news_app/presentation/widgets/network_image_widget/network_image_widget.dart';

class HeadlineItemWidget extends StatelessWidget {
  final HeadlinesNewsArticleDetailsEntity? headlinesNewsModel;

  const HeadlineItemWidget({Key? key, required this.headlinesNewsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: headlinesNewsModel != null
          ? () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 750),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 450),
                      pageBuilder: (_, __, ___) => NewsDetailsScreen(
                            headlinesNewsModel: headlinesNewsModel,
                          )));
            }
          : null,
      child: Padding(
        padding: EdgeInsets.only(
            top: LayoutConstants.dimen_12.h,
            left: LayoutConstants.dimen_16.w,
            right: LayoutConstants.dimen_16.w,
            bottom: LayoutConstants.dimen_12.h),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(LayoutConstants.dimen_8.w),
              child: Hero(
                tag:
                    '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineImageTag}',
                child: NetworkImageWidget(
                  width: double.infinity,
                  height: ScreenUtil().screenWidth / 2.0,
                  imageUrl: headlinesNewsModel?.urlToImage ?? '',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: ScreenUtil().screenWidth / 2.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutConstants.dimen_8.w),
                border: Border.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.0),
                  ],
                ),
              ),
              padding: const EdgeInsets.only(
                      left: LayoutConstants.dimen_12,
                      right: LayoutConstants.dimen_12)
                  .r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag:
                        '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineTitleTag}',
                    child: Text(
                      headlinesNewsModel?.title ?? '',
                      style: Theme.of(context).textTheme.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: LayoutConstants.dimen_14.h,
                        bottom: LayoutConstants.dimen_12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          child: Hero(
                            tag:
                                '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlineSourceTag}',
                            child: Text(
                              headlinesNewsModel?.sourceName ?? '',
                              style: Theme.of(context).textTheme.subTitle,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: LayoutConstants.dimen_8.w),
                            child: Hero(
                              tag:
                                  '${headlinesNewsModel?.title}${HeadlinesNewsConstant.heroHeadlinePublishedTag}',
                              child: Text(
                                headlinesNewsModel?.publishedDate ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColor.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
