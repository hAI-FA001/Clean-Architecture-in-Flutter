import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) => AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
            ),
          )
        ],
      );

  _buildBody() => BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is RemoteArticlesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.refresh),
                  Text((state.error!.error as SocketException).message),
                ],
              ),
            );
          } else if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, idx) => ArticleWidget(
                article: state.articles![idx],
                onArticlePressed: (article) =>
                    _onArticlePressed(context, article),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );

  _onArticlePressed(BuildContext context, ArticleEntity article) =>
      Navigator.pushNamed(context, '/ArticleDetails', arguments: article);

  _onShowSavedArticlesViewTapped(BuildContext context) =>
      Navigator.pushNamed(context, '/SavedArticles');
}
