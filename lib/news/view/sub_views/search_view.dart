import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/error%20/error_model.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:newsapp/news/model/network/network_service.dart';
import 'package:newsapp/screens/widgets/news_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  Future<(ErrorModel?, List<Article>?)>? _searchFuture;

  void _search(String value) {
    final query = value.trim();
    setState(() {
      _searchFuture = query.isEmpty ? null : NetworkService.searchArticles(query);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.search)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: TextField(
              controller: _controller,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: _search,
              decoration: InputDecoration(
                hintText: l10n.searchNews,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  tooltip: l10n.search,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _controller.clear();
                    _search('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchFuture == null
                ? Center(child: Text(l10n.searchNews))
                : FutureBuilder<(ErrorModel?, List<Article>?)>(
                    future: _searchFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError || !snapshot.hasData) {
                        return _messageWithRetry(
                          snapshot.error?.toString() ?? l10n.somethingWentWrong,
                          l10n.tryAgain,
                        );
                      }
                      final result = snapshot.data!;
                      if (result.$1 != null) {
                        return _messageWithRetry(result.$1!.message, l10n.tryAgain);
                      }
                      final articles = result.$2 ?? <Article>[];
                      if (articles.isEmpty) {
                        return Center(child: Text(l10n.noNewsFound));
                      }
                      return ListView.separated(
                        padding: EdgeInsets.all(16.r),
                        itemCount: articles.length,
                        itemBuilder: (context, index) => NewsCard(article: articles[index]),
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _messageWithRetry(String message, String retryLabel) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(message, textAlign: TextAlign.center),
          ),
          TextButton(
            onPressed: () => _search(_controller.text),
            child: Text(retryLabel),
          ),
        ],
      ),
    );
  }
}
