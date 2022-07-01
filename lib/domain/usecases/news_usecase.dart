import 'package:news_app/domain/entities/headlines_news_entity.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class NewsUseCase {
  final NewsRepository newsRepository;

  NewsUseCase({required this.newsRepository});

  Future<HeadlinesNewsEntity> getHeadlinesNews(String category) =>
      newsRepository.getHeadlinesNews(category);
}
