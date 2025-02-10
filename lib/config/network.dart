// import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'network/dio_exception.dart';
import 'network/interceptors/authorization_interceptor.dart';
import 'network/interceptors/logger_interceptor.dart';
// import 'package:firebase_performance_dio/firebase_performance_dio.dart';

const baseUrl = 'https://etaylor-admin.my.id/';
// final baseUrl = dotenv.env['BASEURL_PRODUCTION']!;

class Network {
  static Future<dynamic> postApi(String url, dynamic formData) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
          contentType: 'application/x-www-form-urlencoded',
        ),
      )..interceptors.addAll([
          AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response rest = await dio.post(url, data: formData);
      debugPrint("$url response:${rest.data ?? ""}");
      dio.close();
      return rest.data;
    } on DioError catch (err) {
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      // final errorMessage = DioException.fromDioError(err).toString();
      // debugPrint(errorMessage.toString());
      // throw errorMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiWithHeaders(
      String url, body, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue =
          await dio.post(url, data: body, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      // final errorMessage = DioException.fromDioError(err).toString();
      // throw errorMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiWithHeadersWithoutData(
      String url, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue =
          await dio.post(url, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiWithContentType(
      String url, dynamic formData) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
          contentType: 'application/x-www-form-urlencoded',
        ),
      )..interceptors.addAll([
          AuthorizationInterceptor(),
          LoggerInterceptor(),
        ]);
      Response rest = await dio.post(url, data: formData);
      debugPrint("$url response:${rest.data ?? ""}");
      dio.close();
      return rest.data;
    } on DioError catch (err) {
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      // final errorMessage = DioException.fromDioError(err).toString();
      // debugPrint(errorMessage.toString());
      // throw errorMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiWithHeadersAndContentType(
      String url, dynamic body,
      {String? contentType, Map<String, dynamic>? header}) async {
    try {
      var dio = Dio(
        BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: 500000,
            receiveTimeout: 300000,
            responseType: ResponseType.json,
            maxRedirects: 0,
            contentType: 'application/x-www-form-urlencoded'),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue = await dio.post(url,
          data: body,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header?.clear();
      return restValue.data;
    } on DioError catch (err) {
      // debugPrint(err.message);
      // debugPrint(err.response.toString());
      // debugPrint(err.type.toString());
      // debugPrint(err.requestOptions.toString());
      // debugPrint(err.error);
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      // return err.response?.data;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiWithHeadersContentType(
      String url, dynamic body, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
          contentType: 'application/x-www-form-urlencoded',
          // headers: header,
        ),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue =
          await dio.post(url, data: body, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      // debugPrint(err.message);
      // debugPrint(err.response.toString());
      // debugPrint(err.type.toString());
      // debugPrint(err.requestOptions.toString());
      // debugPrint(err.error);
      // return err.response?.data;
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  // static Future<dynamic> putApiWithHeadersAndContentType(String url, Map<String, dynamic> body, {String? contentType, Map<String, dynamic>? header}) async {
  //   try {
  //     var dio = Dio(
  //       BaseOptions(
  //           baseUrl: dotenv.env['BASEURL']!,
  //           connectTimeout: 500000,
  //           receiveTimeout: 300000,
  //           responseType: ResponseType.json,
  //           maxRedirects: 0,
  //           contentType: 'application/x-www-form-urlencoded'
  //       ),
  //     )..interceptors.addAll([
  //       AuthorizationInterceptor(),
  //       LoggerInterceptor(),
  //     ]);
  //     Response restValue = await dio.put(url, data: body);
  //     debugPrint("$url response:${restValue.data??""}");
  //     dio.close();
  //     header?.clear();
  //     return restValue.data;
  //   } on DioError catch (err) {
  //     debugPrint(err.message);
  //     debugPrint(err.response.toString());
  //     debugPrint(err.type.toString());
  //     debugPrint(err.requestOptions.toString());
  //     debugPrint(err.error);
  //     return err.response?.data;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     throw e.toString();
  //   }
  // }

  static Future<dynamic> getApi(String url, {String? baseurl}) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restGet = await dio.get(url);
      debugPrint("$url response:${restGet.data ?? ""}");
      dio.close();
      return restGet.data;
    } on DioError catch (err) {
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      //final errorMessage = DioException.fromDioError(err).toString();
      //throw errorMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> postApiNotBody(String url, {String? baseurl}) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
          contentType: 'application/x-www-form-urlencoded',
        ),
      )..interceptors.addAll([
          AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restGet = await dio.post(url);
      debugPrint("$url response:${restGet.data ?? ""}");
      dio.close();
      return restGet.data;
    } on DioError catch (err) {
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      //final errorMessage = DioException.fromDioError(err).toString();
      //throw errorMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> getApiWithHeaders(
      String url, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restGet = await dio.get(url, options: Options(headers: header));
      debugPrint("$url response:${restGet.data ?? ""}");
      dio.close();
      header.clear();
      return restGet.data;
    } on DioError catch (err) {
      //final errorMessage = DioException.fromDioError(err).toString();
      //debugPrint("error ${err.response?.statusCode}");
      //throw errorMessage;
      Map<String, dynamic> map = {};
      map["code"] = err.response?.statusCode;
      return Future.value(map);
    } catch (e) {
      debugPrint(e.toString());
      //throw e.toString();
      return e;
    }
  }

  static Future<dynamic> putApiWithHeaders(
      String url, dynamic body, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue =
          await dio.put(url, data: body, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      // final errorMessage = DioException.fromDioError(err).toString();
      // throw errorMessage;
      Map<String, dynamic> map = {};
      map["code"] = err.response?.statusCode;
      return Future.value(map);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> putApiWithHeadersAndContentType(
      String url, dynamic body, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: 500000,
            receiveTimeout: 300000,
            responseType: ResponseType.json,
            maxRedirects: 0,
            contentType: 'application/x-www-form-urlencoded'),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue = await dio.put(url,
          data: body,
          options: Options(
              headers: header, contentType: Headers.formUrlEncodedContentType));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      // final errorMessage = DioException.fromDioError(err).toString();
      // throw errorMessage;
      Map<String, dynamic> error = {};
      error["code"] = err.response?.statusCode;
      error["message"] = err.response?.statusMessage;
      return error;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<dynamic> putApi(String url, Map<String, dynamic> header) async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 500000,
          receiveTimeout: 300000,
          responseType: ResponseType.json,
          maxRedirects: 0,
        ),
      )..interceptors.addAll([
          // AuthorizationInterceptor(),
          LoggerInterceptor(),
          // _interceptorWrapperPerf(),
          // DioFirebasePerformanceInterceptor(),
        ]);
      Response restValue =
          await dio.put(url, options: Options(headers: header));
      debugPrint("$url response:${restValue.data ?? ""}");
      dio.close();
      header.clear();
      return restValue.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  // static InterceptorsWrapper _interceptorWrapperPerf() {
  //   return InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       final Trace httpTrace =
  //       FirebasePerformance.instance.newTrace(options.uri.path);
  //       httpTrace.start();
  //       handler.next(options);
  //     },
  //     onResponse: (response, handler) {
  //       final Trace httpTrace = FirebasePerformance.instance
  //           .newTrace(response.requestOptions.uri.path);
  //       httpTrace.stop();
  //       handler.next(response);
  //     },
  //     onError: (DioError error, handler) {
  //       final Trace httpTrace = FirebasePerformance.instance
  //           .newTrace(error.requestOptions.uri.path);
  //       httpTrace.stop();
  //       handler.next(error);
  //     },
  //   );
  // }
}
