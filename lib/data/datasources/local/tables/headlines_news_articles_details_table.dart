import 'package:hive/hive.dart';
import 'package:news_app/data/datasources/local/constants/local_database_type_constant.dart';
import 'package:news_app/data/models/headlines_news_model.dart';
part 'headlines_news_articles_details_table.g.dart';

@HiveType(typeId: HiveTypeIdConstants.newsArticlesTableId)
class HeadlinesNewsArticleDetailsTable
    extends HeadlinesNewsArticleDetailsModel {
  HeadlinesNewsArticleDetailsTable({
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
    String? sourceName,
  }) : super(
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
            sourceName: sourceName);

  factory HeadlinesNewsArticleDetailsTable.fromModel(
      HeadlinesNewsArticleDetailsModel? model) {
    return HeadlinesNewsArticleDetailsTable(
        title: model?.title ?? '',
        urlToImage: model?.urlToImage ?? '',
        url: model?.url ?? '',
        publishedAt: model?.publishedAt ?? '',
        description: model?.description ?? '',
        content: model?.content ?? '',
        author: model?.author ?? '',
        sourceName: model?.sourceName ?? '');
  }
}
