import 'package:dio/dio.dart';
import 'package:newsapp/common/app_consts.dart';
import 'package:newsapp/common/error%20/error_model.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article.dart';
import 'package:newsapp/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:newsapp/news/model/data_models/source_model.dart';
import 'package:newsapp/news/model/network/endpoints.dart';

class NetworkService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseUrl,
      queryParameters: {"apiKey": AppConsts.apiKey},
    ),
  );

  static Future<(ErrorModel?, List<Sources>?)> getSources(
    String category,
  ) async {
    try {
      Response response = await dio.get(
        Endpoints.sourceEndpoints,
        queryParameters: {"category": category},
      );

      if (response.statusCode == 200 && response.data != null) {
        SourceModel sourceModel = SourceModel.fromJson(response.data);
        return (null, sourceModel.sources);
      } else {
        return (TypeParseError(errorMessage: response.data.toString()), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    }
  } // get channels

  static Future<(ErrorModel?, List<Article>?)> getArticles(
    String sourceId,
  ) async {
    try {
      Response response = await dio.get(
        Endpoints.articlesEndpoint,
        queryParameters: {"sources": sourceId},
      );

      if (response.statusCode == 200 && response.data != null) {
        ArticleResponseModel articleResponseModel =
            ArticleResponseModel.fromMap(
              Map<String, dynamic>.from(response.data),
            );

        return (null, articleResponseModel.articles);
      } else {
        return (TypeParseError(errorMessage: response.data.toString()), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    }
  }

  static Future<(ErrorModel?, List<Article>?)> searchArticles(
    String query,
  ) async {
    try {
      final response = await dio.get(
        '/v2/everything',
        queryParameters: {'q': query, 'pageSize': 30, 'sortBy': 'publishedAt'},
      );
      if (response.statusCode == 200 && response.data != null) {
        final model = ArticleResponseModel.fromMap(
          Map<String, dynamic>.from(response.data),
        );
        return (null, model.articles);
      }
      return (TypeParseError(errorMessage: response.data.toString()), null);
    } on Exception catch (e) {
      return (ErrorModel.errorHandler(e), null);
    }
  }

}
   // get news

