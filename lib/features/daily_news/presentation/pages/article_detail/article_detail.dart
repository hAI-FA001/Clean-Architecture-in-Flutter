import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_learn_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:project_learn_clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:project_learn_clean_arch/injection_container.dart';

class ArticleDetailsView extends HookWidget {
  final ArticleEntity? article;

  const ArticleDetailsView({super.key, this.article});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => sl<LocalArticleBloc>(),
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
          floatingActionButton: _buildFloatingActionButton(),
        ),
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
        leading: Builder(
            builder: (context) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _onBackButtonTapped(context),
                  child: const Icon(
                    Ionicons.chevron_back,
                    color: Colors.black,
                  ),
                )),
      );

  Widget _buildBody() => SingleChildScrollView(
        child: Column(
          children: [
            _buildArticleTitleAndDate(),
            _buildArticleImage(),
            _buildArticleDescription(),
          ],
        ),
      );

  _buildArticleTitleAndDate() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article!.title!,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                const Icon(
                  Ionicons.time_outline,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  article!.publishedAt!,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      );

  _buildArticleImage() => Container(
        width: double.maxFinite,
        height: 250,
        margin: const EdgeInsets.only(top: 14),
        child: Image.network(
          article!.urlToImage!,
          fit: BoxFit.cover,
        ),
      );

  _buildArticleDescription() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        child: Text(
          '${article!.description ?? ''}\n\n${article!.content ?? ''}',
          style: const TextStyle(fontSize: 16),
        ),
      );

  _buildFloatingActionButton() => Builder(
      builder: (context) => FloatingActionButton(
            onPressed: () => _onFloatingActionButtonPressed(context),
            child: const Icon(
              Ionicons.bookmark,
              color: Colors.white,
            ),
          ));

  void _onBackButtonTapped(BuildContext context) => Navigator.pop(context);

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context)
        .add(SaveArticle(article: article!));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Article saved locally.'),
      backgroundColor: Colors.black,
    ));
  }
}
