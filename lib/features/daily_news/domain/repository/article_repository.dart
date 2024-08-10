import 'package:project_learn_clean_arch/core/resources/data_state.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
