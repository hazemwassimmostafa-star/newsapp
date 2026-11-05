import 'package:flutter/material.dart';
import 'package:newsapp/common/enums/category_enum.dart';
import 'package:newsapp/common/error%20/error_model.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:newsapp/news/model/data_models/source_model.dart';
import 'package:newsapp/news/model/network/network_service.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;

  List<Sources>? sources;
  bool isSourcesLoading = false;
  String? sourcesErrorMessage;

  List<Article>? articles;
  bool isArticlesLoading = false;
  String? articlesErrorMessage;

  void changeCategory(CategoryEnum? newCategory) {
    categoryEnum = newCategory;
    notifyListeners();
  }

  Future<void> getSources() async {
    sourcesErrorMessage = null;
    sources = null;
    isSourcesLoading = true;

    notifyListeners();

    if (categoryEnum != null) {
      (ErrorModel?, List<Sources>?) response = await NetworkService.getSources(
        categoryEnum == CategoryEnum.tecnology
            ? "technology"
            : categoryEnum!.name,
      );

      if (response.$1 != null) {
        sourcesErrorMessage = response.$1!.message;
      } else if (response.$2 != null) {
        print('-->${response.$2!.length}');
        sources = response.$2;
      }

      notifyListeners();
    }

    isSourcesLoading = false;
    notifyListeners();
  }

  Future<void> getArticles(String sourceId) async {
    articlesErrorMessage = null;
    articles = null;
    isArticlesLoading = true;

    notifyListeners();

    if (sourceId.isNotEmpty) {
      (ErrorModel?, List<Article>?) response = await NetworkService.getArticles(
        sourceId,
      );

      if (response.$1 != null) {
        articlesErrorMessage = response.$1!.message;
      } else if (response.$2 != null) {
        print('-->${response.$2!.length}');
        articles = response.$2;
      }

      notifyListeners();
    }

    isArticlesLoading = false;
    notifyListeners();
  }
}
