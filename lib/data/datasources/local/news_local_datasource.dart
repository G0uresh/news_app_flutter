import 'package:news_app/common/utils/database_util.dart';
import 'package:news_app/data/datasources/local/base_local_datasource.dart';
import 'package:news_app/data/datasources/local/constants/local_datasource_boxname_constants.dart';
import 'package:news_app/data/datasources/local/tables/headlines_news_articles_details_table.dart';
import 'package:news_app/data/models/headlines_news_model.dart';

class NewsLocalDatasource
    extends BaseLocalDatasource<HeadlinesNewsArticleDetailsTable> {
  NewsLocalDatasource()
      : super(boxName: LocalDataSourceBoxNameConstants.newsArticles) {
    DatabaseUtil.registerAdapter<HeadlinesNewsArticleDetailsTable>(
        HeadlinesNewsArticleDetailsTableAdapter());
  }

  Future<void> insertOrUpdateItems(
      List<HeadlinesNewsArticleDetailsModel?>? articlesList) async {
    try {
      if (articlesList != null && articlesList.isNotEmpty) {
        final Map<String, HeadlinesNewsArticleDetailsTable>
            coinsTransactionMap = {
          for (final article in articlesList)
            article?.author ?? 'default':
                HeadlinesNewsArticleDetailsTable.fromModel(article)
        };
        await putAll(coinsTransactionMap);
      }
    } catch (error) {
      print('error occured while inserting');
    }
  }

  Future<List<HeadlinesNewsArticleDetailsModel>> getAllItems() async {
    try {
      final List<HeadlinesNewsArticleDetailsTable?>? articlesList =
          await getAll();
      return articlesList
              ?.map((articleDetails) =>
          HeadlinesNewsArticleDetailsModel.fromTable(articleDetails))
              .toList() ??
          [];
    } catch (error) {
      print(
        'Error while getting articles',
      );
      return [];
    }
  }
}
