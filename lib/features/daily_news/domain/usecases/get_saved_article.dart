import 'package:project_learn_clean_arch/core/usecases/usecase.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticle implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticle(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({params}) =>
      _articleRepository.getSavedArticles();
}
