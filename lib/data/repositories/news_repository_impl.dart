import 'dart:async';

import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/data/datasources/local/news_local_datasource.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';
import 'package:news_app/data/models/headlines_news_model.dart';
import 'package:news_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDatasource newsLocalDataSource;

  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    required this.newsLocalDataSource,
    required this.newsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<HeadlinesNewsModel> getHeadlinesNews(String category) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await newsRemoteDataSource.getHeadlinesNews(category);
        unawaited(newsLocalDataSource.insertOrUpdateItems(response.articles));
        return response;
      } catch (error) {
        return await getHeadlinesNewsFromLocal();
      }
    } else {
      return await getHeadlinesNewsFromLocal();
    }
  }

  Future<HeadlinesNewsModel> getHeadlinesNewsFromLocal() async {
    final articleList = await newsLocalDataSource.getAllItems();
    articleList.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    return HeadlinesNewsModel(
        status: 'local', totalResults: articleList.length, articles: articleList);
  }
}
