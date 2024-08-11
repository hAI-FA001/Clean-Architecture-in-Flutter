import 'package:floor/floor.dart';
import 'package:project_learn_clean_arch/core/constants/constants.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';

// why use model? why not use entity? -> Domain layer must be independent, should not depend on DB, or whether we use JSON, XML, etc

class ArticleResponseModel {
  List<ArticleModel> articles;

  ArticleResponseModel({required this.articles});

  factory ArticleResponseModel.fromJson(Map<String, dynamic> map) =>
      ArticleResponseModel(
          articles: ((map['articles'] ?? []) as List<dynamic>)
              .map((dynamic article) => ArticleModel.fromJson(article))
              .toList());
}

@Entity(tableName: "T_article", primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
        author: map['author'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        url: map['url'] ?? '',
        urlToImage:
            (map['urlToImage'] ?? '') != '' ? map['urlToImage'] : kDefaultImage,
        publishedAt: map['publishedAt'] ?? '',
        content: map['content'] ?? '',
      );

  factory ArticleModel.fromEntity(ArticleEntity entity) => ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );
}
