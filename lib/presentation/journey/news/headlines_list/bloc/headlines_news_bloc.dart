import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/entities/headlines_news_entity.dart';
import 'package:news_app/domain/usecases/news_usecase.dart';

import './bloc.dart';

class HeadlinesNewsBloc extends Bloc<HeadlinesNewsEvent, HeadlinesNewsState> {
  final NewsUseCase newsUseCase;

  HeadlinesNewsBloc({required this.newsUseCase})
      : super(InitialHeadlinesNewsState());

  @override
  Stream<HeadlinesNewsState> mapEventToState(
    HeadlinesNewsEvent event,
  ) async* {
    if (event is GetHeadlinesNewsEvent) {
      yield* _mapGetHeadlinesNewsEventToState(event);
    } else if (event is LoadMoreHeadlinesNewsEvent) {
      yield* _mapLoadMoreHeadlinesNewsEventToState(event);
    }
  }

  Stream<HeadlinesNewsState> _mapGetHeadlinesNewsEventToState(
      GetHeadlinesNewsEvent event) async* {
    yield LoadingHeadlinesNewsState();
    final HeadlinesNewsEntity headlines =
        await newsUseCase.getHeadlinesNews('all');
    yield LoadedHeadlinesNewsState(articles: headlines.articlesList);
  }

  Stream<HeadlinesNewsState> _mapLoadMoreHeadlinesNewsEventToState(
    LoadMoreHeadlinesNewsEvent event,
  ) async* {}
}
