import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:project_learn_clean_arch/injection_container.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticles()),
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      );

  _buildAppBar() => AppBar(
        leading: Builder(
            builder: (context) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _onBackButtonTapped(context),
                  child: const Icon(
                    Ionicons.chevron_back,
                    color: Colors.black,
                  ),
                )),
        title: const Text(
          'Saved Articles',
          style: TextStyle(color: Colors.black),
        ),
      );

  _buildBody() => BlocBuilder<LocalArticleBloc, LocalArticleState>(
        builder: (context, state) {
          if (state is LocalArticleLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is LocalArticleDone) {
            return _buildArticlesList(state.articles!);
          }
          return Container();
        },
      );

  _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          "NO SAVED ARTICLES",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, idx) => ArticleWidget(
          article: articles[idx],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        ),
      );
    }
  }

  _onBackButtonTapped(BuildContext context) => Navigator.pop(context);

  _onRemoveArticle(BuildContext context, ArticleEntity article) =>
      BlocProvider.of<LocalArticleBloc>(context).add(
        RemoveArticle(article: article),
      );

  _onArticlePressed(BuildContext context, ArticleEntity article) =>
      Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}
