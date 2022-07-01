class LocalDataSourceBoxNameConstants {
  // If you add new box, you need to register inside "all" fields as well
  // Otherwise it will give unexpexted behavior after clearing local storage
  static const List<String> all = [
    newsArticles,
  ];

  static const String newsArticles = 'news_articles';

}
