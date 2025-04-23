import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_stor/core/networking/api_endpoints.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.post(endPoint, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
