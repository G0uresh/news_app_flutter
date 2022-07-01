import 'package:equatable/equatable.dart';

abstract class HeadlinesNewsEvent extends Equatable {
  const HeadlinesNewsEvent();

  @override
  List<Object> get props => [];
}

class GetHeadlinesNewsEvent extends HeadlinesNewsEvent {}

class LoadMoreHeadlinesNewsEvent extends HeadlinesNewsEvent {}
