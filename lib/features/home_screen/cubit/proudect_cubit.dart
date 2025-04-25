import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_stor/features/home_screen/cubit/proudect_state.dart';
import 'package:shop_stor/features/home_screen/repo/home_repo.dart';

class ProudectCubit extends Cubit<ProudectState> {
  ProudectCubit(this._homeRepo) : super(ProudectInitial());
  final HomeRepo _homeRepo;

  void fetchProdects() async {
    emit(ProudectLoading());
    final res = await _homeRepo.getProudects();
    res.fold((error) {
      emit(ProudectError(error));
    }, (right) {
      emit(ProudectLoaded(right));
    });
  }

  void fetchProdectCategories(String catName) async {
    emit(ProudectLoading());
    final res = await _homeRepo.getProudectCategories(catName);
    res.fold((error) {
      emit(ProudectError(error));
    }, (right) {
      emit(ProudectLoaded(right));
    });
  }
}
