import 'package:dio/dio.dart';

sealed class ErrorModel {
  final String message;
  final int? erroCode;
  ErrorModel({required this.message, this.erroCode});
  static ErrorModel errorHandler(Exception error) {
    if (error is DioException) {
      return _handelDioError(error);
    } else {
      return TypeParseError(errorMessage: error.toString());
    }
  }

  static ErrorModel _handelDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
        return NetworkError();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return AuthError(errorMessage: e.response?.data["message"] ?? "");
        } else if (statusCode == 404) {
          return RequestError();
        } else {
          return GeneralError();
        }
      case DioExceptionType.cancel:
        return GeneralError();
      default:
        return GeneralError();
    }
  }
}

class GeneralError extends ErrorModel {
  GeneralError({String? errorMessage, super.erroCode})
    : super(message: errorMessage ?? "auth error ");
}

class AuthError extends ErrorModel {
  AuthError({String? errorMessage, super.erroCode})
    : super(message: errorMessage ?? "auth error ");
}

class TypeParseError extends ErrorModel {
  TypeParseError({String? errorMessage, super.erroCode})
    : super(message: errorMessage ?? "");
}

class NetworkError extends ErrorModel {
  NetworkError() : super(message: "no network conection");
}

class RequestError extends ErrorModel {
  RequestError() : super(message: "somethig   went wrong while conection ");
}
