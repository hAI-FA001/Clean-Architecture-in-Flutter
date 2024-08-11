import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() => AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      );

  _buildBody() => BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is RemoteArticlesError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          } else if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, idx) => ArticleWidget(
                article: state.articles![idx],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
}
