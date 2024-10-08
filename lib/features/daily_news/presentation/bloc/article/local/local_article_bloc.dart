import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/remove_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/usecases/save_article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles: articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles =
        await _getSavedArticleUseCase(params: removeArticle.article);
    emit(LocalArticleDone(articles: articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase(params: saveArticle.article);
    emit(LocalArticleDone(articles: articles));
  }
}
