import 'package:news_app/domain/entities/headlines_news_entity.dart';

abstract class NewsRepository {
  Future<HeadlinesNewsEntity> getHeadlinesNews(String category);
}
