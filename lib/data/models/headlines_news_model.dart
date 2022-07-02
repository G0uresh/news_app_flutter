import 'package:news_app/common/utils/string_constant.dart';
import 'package:news_app/data/datasources/local/tables/headlines_news_articles_details_table.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';

class HeadlinesNewsModel extends  HeadlinesNewsEntity {

  List<HeadlinesNewsArticleDetailsModel?>? articles;

  HeadlinesNewsModel({
    required String status,
    required int totalResults,
    required this.articles,
  }) : super(status : status, totalResults : totalResults , articlesList: articles) ;

  factory HeadlinesNewsModel.fromJson(Map<String, dynamic> json) {
    List list = json['articles'];
    List<HeadlinesNewsArticleDetailsModel> articles =
        list.map((e) => HeadlinesNewsArticleDetailsModel.fromJson(e)).toList();
    return HeadlinesNewsModel(
      status: json['status'] ?? StringConstants.emptyValue,
      totalResults: json['totalResults'] ?? 0,
      articles: articles,
    );
  }
}

class HeadlinesNewsArticleDetailsModel
    extends HeadlinesNewsArticleDetailsEntity {
  HeadlinesNewsArticleDetailsModel({
    String? sourceName,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          sourceName: sourceName,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory HeadlinesNewsArticleDetailsModel.fromJson(Map<String, dynamic> json) {
    return HeadlinesNewsArticleDetailsModel(
      sourceName: json['source'] == null
          ? null
          : json['source']['name'] ?? StringConstants.emptyValue,
      author: json['author'] ?? StringConstants.emptyValue,
      title: json['title'] ?? StringConstants.emptyValue,
      description: json['description'] ?? StringConstants.emptyValue,
      url: json['url'] ?? StringConstants.emptyValue,
      urlToImage: json['urlToImage'] ?? StringConstants.emptyValue,
      publishedAt: json['publishedAt'] ?? StringConstants.emptyValue,
      content: json['content'] ?? StringConstants.emptyValue,
    );
  }

  factory HeadlinesNewsArticleDetailsModel.fromTable(HeadlinesNewsArticleDetailsTable? table) {
    return HeadlinesNewsArticleDetailsModel(
      sourceName: table?.sourceName ?? StringConstants.emptyValue,
      author: table?.author ?? StringConstants.emptyValue,
      title: table?.title ?? StringConstants.emptyValue,
      description: table?.description ?? StringConstants.emptyValue,
      url: table?.url ?? StringConstants.emptyValue,
      urlToImage: table?.urlToImage ?? StringConstants.emptyValue,
      publishedAt: table?.publishedAt ?? StringConstants.emptyValue,
      content: table?.content ?? StringConstants.emptyValue,
    );
  }
}

class ArticleSourceModel {
  ArticleSourceModel({required String name});

  factory ArticleSourceModel.fromJson(Map<String, dynamic> json) {
    return ArticleSourceModel(name: json['name'] ?? StringConstants.emptyValue);
  }
}
