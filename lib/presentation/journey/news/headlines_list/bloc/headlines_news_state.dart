import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';

abstract class HeadlinesNewsState extends Equatable {
  final List<HeadlinesNewsArticleDetailsEntity?>? listArticles;

  const HeadlinesNewsState({this.listArticles});

  @override
  List<Object> get props => [];
}

class InitialHeadlinesNewsState extends HeadlinesNewsState {}

class LoadingHeadlinesNewsState extends HeadlinesNewsState {}

class LoadedHeadlinesNewsState extends HeadlinesNewsState {
  final List<HeadlinesNewsArticleDetailsEntity?>? articles;

  const LoadedHeadlinesNewsState({required this.articles})
      : super(listArticles: articles);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'LoadedTopHeadlinesNewsState{listArticles: $listArticles}';
  }
}

class FailureHeadlinesNewsState extends HeadlinesNewsState {
  final String errorMessage;

  const FailureHeadlinesNewsState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'FailureTopHeadlinesNewsState{errorMessage: $errorMessage}';
  }
}
