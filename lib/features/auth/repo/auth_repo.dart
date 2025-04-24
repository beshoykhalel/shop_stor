import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_stor/core/networking/api_endpoints.dart';
import 'package:shop_stor/core/networking/dio_helper.dart';
import 'package:shop_stor/features/auth/models/login_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;

  AuthRepo(this._dioHelper);
  Future<Either<String, LoginResponseModel>> login(
      String userName, String password) async {
    try {
      final response = await _dioHelper.postRequest(
          endPoint: ApiEndpoints.login,
          data: {"username": userName, "password": password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(response.data);
        return Right(loginResponseModel);
      } else {
        return Left(response.toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response.toString());
      }

      return Left(error.toString());
    }
  }
}
