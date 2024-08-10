import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';

// why use model? why not use entity? -> Domain layer must be independent, should not depend on DB, or whether we use JSON, XML, etc

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
        author: map['author'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        url: map['url'] ?? '',
        urlToImage: map['urlToImage'] ?? '',
        publishedAt: map['publishedAt'] ?? '',
        content: map['content'] ?? '',
      );
}
