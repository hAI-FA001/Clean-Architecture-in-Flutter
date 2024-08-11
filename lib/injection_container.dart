import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/remove_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/save_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

// service locator pattern
final sl = GetIt.instance;

// for registering all classes and contracts before runApp is called
Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
