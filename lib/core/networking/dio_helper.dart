import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_stor/core/networking/api_endpoints.dart';

class DioHelper {
  Dio? dio;

  DioHelper() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Response response =
          await dio!.get(endPoint, queryParameters: query);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await dio!.post(endPoint, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
