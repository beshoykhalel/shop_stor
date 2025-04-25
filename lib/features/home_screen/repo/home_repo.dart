import 'package:dartz/dartz.dart';
import 'package:shop_stor/core/networking/api_endpoints.dart';
import 'package:shop_stor/core/networking/dio_helper.dart';
import 'package:shop_stor/features/home_screen/models/categores_model.dart';
import 'package:shop_stor/features/home_screen/models/proudects_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  Future<Either<String, List<ProdectsModel>>> getProudects() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.products,
      );
      if (response.statusCode == 200) {
        List<ProdectsModel> proudects = prodectModelFromJson(response.data);
        return Right(proudects);
      } else {
        return Left("Somthing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProdectsModel>>> getProudectCategories(
      String catName) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: "${ApiEndpoints.catProudects}/$catName",
      );
      if (response.statusCode == 200) {
        List<ProdectsModel> proudects = prodectModelFromJson(response.data);
        return Right(proudects);
      } else {
        return Left("Somthing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );
      if (response.statusCode == 200) {
        List<String> categories = categoryModelFromJson(response.data);
        return Right(categories);
      } else {
        return Left("Somthing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
