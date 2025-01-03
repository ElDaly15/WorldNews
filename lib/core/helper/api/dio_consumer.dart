import 'package:daily_news/core/helper/api/api_consumer.dart';
import 'package:daily_news/core/helper/api/endpoints.dart';
import 'package:daily_news/core/helper/api/interceptors.dart';
import 'package:daily_news/core/helper/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        error: true));
  }
  @override
  Future delete(String baseUrl,
      {dynamic body,
      Map<String, dynamic>? queryPrameters,
      bool isForm = false}) async {
    try {
      var response = await dio.delete(baseUrl,
          data: isForm ? FormData.fromMap(body) : body,
          queryParameters: queryPrameters);
      return response.data;
    } on DioException catch (e) {
      dioServerExceptions(e);
    } catch (e) {
      throw ('Unknown Error');
    }
  }

  @override
  Future get(String baseUrl,
      {dynamic body,
      Map<String, dynamic>? queryPrameters,
      bool isForm = false}) async {
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: queryPrameters,
        data: isForm ? FormData.fromMap(body) : body,
      );
      return response.data;
    } on DioException catch (e) {
      dioServerExceptions(e);
    } catch (e) {
      throw ('Unknown Error');
    }
  }

  @override
  Future patch(String baseUrl,
      {dynamic body,
      Map<String, dynamic>? queryPrameters,
      bool isForm = false}) async {
    try {
      var response = await dio.patch(
        baseUrl,
        queryParameters: queryPrameters,
        data: isForm ? FormData.fromMap(body) : body,
      );
      return response.data;
    } on DioException catch (e) {
      dioServerExceptions(e);
    } catch (e) {
      throw ('Unknown Error');
    }
  }

  @override
  Future post(String baseUrl,
      {dynamic body,
      Map<String, dynamic>? queryPrameters,
      bool isForm = false}) async {
    try {
      var response = await dio.post(
        baseUrl,
        queryParameters: queryPrameters,
        data: isForm ? FormData.fromMap(body) : body,
      );
      return response.data;
    } on DioException catch (e) {
      dioServerExceptions(e);
    } catch (e) {
      throw ('Unknown Error');
    }
  }
}
