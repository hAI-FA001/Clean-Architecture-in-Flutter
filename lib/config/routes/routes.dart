import 'package:flutter/material.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());
      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(
          article: settings.arguments as ArticleEntity,
        ));
      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) =>
      MaterialPageRoute(builder: (_) => view);
}
