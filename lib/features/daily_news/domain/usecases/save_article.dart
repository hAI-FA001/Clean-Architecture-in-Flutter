import 'package:project_learn_clean_arch/core/usecases/usecase.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/repository/article_repository.dart';

class SaveArticle implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticle(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) =>
      _articleRepository.saveArticle(params!);
}
