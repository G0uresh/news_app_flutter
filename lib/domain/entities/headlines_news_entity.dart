import 'package:hive/hive.dart';

class HeadlinesNewsEntity {
  final String status;
  final int totalResults;
  final List<HeadlinesNewsArticleDetailsEntity?>? articles;

  HeadlinesNewsEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}

class HeadlinesNewsArticleDetailsEntity {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;
  @HiveField(7)
  final String? sourceName;

  HeadlinesNewsArticleDetailsEntity( {
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.sourceName,
  });

  String get publishedDate => publishedAt.split('T')[0];
}
