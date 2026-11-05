import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/error%20/error_model.dart';
import 'package:newsapp/common/extension/context_extension.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:newsapp/news/model/network/network_service.dart';
import 'package:newsapp/screens/widgets/error_widget.dart';
import 'package:newsapp/screens/widgets/news_card.dart';

class ArticlesBody extends StatefulWidget {
  final String sourceId;

  const ArticlesBody({super.key, required this.sourceId});

  @override
  State<ArticlesBody> createState() => _ArticlesBodyState();
}

class _ArticlesBodyState extends State<ArticlesBody> {
  late Future<(ErrorModel?, List<Article>?)> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = NetworkService.getArticles(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant ArticlesBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      _articlesFuture = NetworkService.getArticles(widget.sourceId);
    }
  }

  //get articels --api
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _articlesFuture,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: context.theme.colorScheme.secondary,
            ),
          );
        }
        if (asyncSnapshot.hasError || !asyncSnapshot.hasData) {
          return CustomErrorwidget(
            errorMEssage: asyncSnapshot.error?.toString() ?? 'Unable to load articles',
            onRefresh: () {
              setState(() {
                _articlesFuture = NetworkService.getArticles(widget.sourceId);
              });
            },
          );
        }
        (ErrorModel?, List<Article>?) response = asyncSnapshot.data!;
        if (response.$1 != null) {
          return CustomErrorwidget(
            errorMEssage: response.$1!.message,
            onRefresh: () {
              setState(() {
                _articlesFuture = NetworkService.getArticles(widget.sourceId);
              });
            },
          );
        }
        List<Article> articles = response.$2 ?? [];
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) => NewsCard(article: articles[index]),
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: articles.length,
        );
      },
    );
  }
}
