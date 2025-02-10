import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dio_exception.dart';
import 'interceptors/authorization_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env['BASEURL']!,
            connectTimeout: 5000,
            receiveTimeout: 3000,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

  Future<dynamic> getApi(String url) async {
    try {
      final restGet = await _dio.get(url);
      debugPrint("$url response:${restGet.data ?? ""}");
      _dio.close();
      return restGet.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> getApiWithHeaders(
      String url, Map<String, dynamic> header) async {
    try {
      Response restGet = await _dio.get(url, options: Options(headers: header));
      debugPrint("$url response:${restGet.data ?? ""}");
      _dio.close();
      return restGet.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> postApi(String url, FormData formData) async {
    try {
      Response rest = await _dio.post(url, data: formData);
      debugPrint("$url response:${rest.data ?? ""}");
      _dio.close();
      return rest.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> postApiWithHeaders(
      String url, FormData body, Map<String, dynamic> header) async {
    try {
      Response restValue =
          await _dio.post(url, data: body, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      _dio.close();
      return restValue.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
