import 'package:shop_stor/features/cart_screen/models/cart_model.dart';

abstract class CartState {}

class InitalCartState extends CartState {}

class LoadindCarts extends CartState {}

class SuccessGettingCarts extends CartState {
  final CartModel cart;

  SuccessGettingCarts(this.cart);
}

class ErrorGettingCarts extends CartState {
  final String message;

  ErrorGettingCarts(this.message);
}

class AddingToCarts extends CartState {}

class SuccessAddingToCarts extends CartState {
  final CartModel cart;

  SuccessAddingToCarts(this.cart);
}

class ErrorAddingToCarts extends CartState {
  final String message;

  ErrorAddingToCarts(this.message);
}
