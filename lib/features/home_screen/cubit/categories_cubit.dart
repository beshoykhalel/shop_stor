import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_stor/features/home_screen/cubit/categories_state.dart';
import 'package:shop_stor/features/home_screen/repo/home_repo.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());
  final HomeRepo _homeRepo;

  void fetchCategories() async {
    emit(CategoriesLoading());
    final Either<String, List<String>> res = await _homeRepo.getCategories();
    res.fold((error) {
      emit(CategoriesError(error));
    }, (categories) {
      emit(CategoriesLoaded(categories));
    });
  }
}
