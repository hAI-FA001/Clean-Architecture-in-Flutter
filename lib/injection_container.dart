import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

// service locator pattern
final sl = GetIt.instance;

// for registering all classes and contracts before run app is called
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
