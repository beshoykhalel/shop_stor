import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_stor/features/cart_screen/cubit/cart_state.dart';
import 'package:shop_stor/features/cart_screen/repo/cart_repo.dart';
import 'package:shop_stor/features/home_screen/models/proudects_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(InitalCartState());
  final CartRepo _cartRepo;
  fetchCarts() async {
    emit(LoadindCarts());
    final res = await _cartRepo.getUserCart();
    res.fold((error) {
      emit(ErrorGettingCarts(error));
    }, (cart) {
      emit(SuccessGettingCarts(cart));
    });
  }

  addingToCarts({required ProductsModel product, required int quantity}) async {
    emit(AddingToCarts());
    DateTime dateTime = DateTime.now();
    final res = await _cartRepo.addToCart(
        date: dateTime.toString(), product: product, quantity: quantity);
    res.fold((error) {
      emit(ErrorAddingToCarts(error));
    }, (cart) {
      emit(SuccessAddingToCarts(cart));
    });
  }
}
