import 'package:flutter/cupertino.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';
import 'package:news_app/presentation/journey/news/headlines_list/widgets/headline_item_widget.dart';

class HeadlinesListBody extends StatelessWidget {
  final List<HeadlinesNewsArticleDetailsEntity?>? headlinesList;

  const HeadlinesListBody({Key? key, required this.headlinesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HeadlineItemWidget(
          headlinesNewsModel: headlinesList![index],
        );
      }, childCount: headlinesList?.length??0),
    );
  }
}


