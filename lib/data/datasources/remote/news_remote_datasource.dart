import 'package:dio/dio.dart';
import 'package:news_app/data/datasources/remote/constants/news_remote_constant.dart';
import 'package:news_app/data/models/headlines_news_model.dart';

class NewsRemoteDataSource {
  late final Dio dio;

  NewsRemoteDataSource({
    required this.dio,
  });

  Future<HeadlinesNewsModel> getHeadlinesNews(String category) async {
   late Response response;
    if (category == 'all') {
      response = await dio.get(
        NewsEndPoints.baseUrl+NewsEndPoints.getHeadlinesNews,
        queryParameters: {
          'country': 'id',
          'apiKey': NewsEndPoints.newsApiKey,
        },
      );
    } else {
      response = await dio.get(
        NewsEndPoints.baseUrl+NewsEndPoints.getHeadlinesNews,
        queryParameters: {
          'country': 'id',
          'apiKey': NewsEndPoints.newsApiKey,
          'category': category,
        },
      );
    }
    if (response.statusCode == 200) {
      return HeadlinesNewsModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
