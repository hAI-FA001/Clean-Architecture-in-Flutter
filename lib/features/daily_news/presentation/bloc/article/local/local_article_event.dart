import 'package:equatable/equatable.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle({super.article});
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle({super.article});
}
