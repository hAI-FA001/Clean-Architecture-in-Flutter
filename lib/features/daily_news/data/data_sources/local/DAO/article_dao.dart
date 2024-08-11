import 'package:floor/floor.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM T_article')
  Future<List<ArticleModel>> getArticles();
}
