import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_stor/core/networking/api_endpoints.dart';
import 'package:shop_stor/core/networking/dio_helper.dart';
import 'package:shop_stor/features/cart_screen/models/cart_model.dart';

class CartRepo {
  final DioHelper _dioHelper;

  CartRepo(this._dioHelper);
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.carts + "/user/2",
      );
      if (response.statusCode == 200) {
        CartModel cartsModel = CartModel.fromJson(response.data);
        return Right(cartsModel);
      } else {
        return const Left("Error in Getting Cart");
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response.toString());
      }

      return Left(error.toString());
    }
  }
}
