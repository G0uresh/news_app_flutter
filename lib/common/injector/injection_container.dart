import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/network/dio_logging_interceptor.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/data/datasources/local/news_local_datasource.dart';
import 'package:news_app/data/datasources/remote/news_remote_datasource.dart';
import 'package:news_app/data/repositories/news_repository_impl.dart';
import 'package:news_app/domain/repositories/news_repository.dart';
import 'package:news_app/domain/usecases/news_usecase.dart';
import 'package:news_app/presentation/journey/news/headlines_list/bloc/bloc.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  getIt.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(DioLoggingInterceptor());
    return dio;
  });

  _configureBlocs();
  _configureUseCases();
  _configureRepositories();
  _configureDataSources();
}

void _configureDataSources() {
  getIt.registerFactory(() => NewsRemoteDataSource(dio: getIt()));
  getIt.registerFactory(() => NewsLocalDatasource());
}

void _configureRepositories() {
  getIt.registerFactory<NewsRepository>(() => NewsRepositoryImpl(
      networkInfo: getIt(),
      newsRemoteDataSource: getIt(),
      newsLocalDataSource: getIt()));
}

void _configureUseCases() {
  getIt.registerFactory(() => NewsUseCase(newsRepository: getIt()));
}

void _configureBlocs() {
  getIt.registerFactory(() => HeadlinesNewsBloc(newsUseCase: getIt()));
}
