import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/shared/models/cart_model.dart';
import 'package:shopping_cart/shared/models/product_model.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  String errorMessage = "";

  @observable //observar aquilo que influencia na renderizção
  AppStatus appStatus = AppStatus.empty;

  @observable
  ObservableList<CartModel> cartList = ObservableList<CartModel>();

  @observable
  String listLength = "0";

  @observable
  String priceSum = "";

  @action
  void listSizeAndPriceSum() {
    listLength = cartList
        .fold(
            0, (int previousValue, element) => previousValue + element.quantity)
        .toString();

    priceSum = cartList
        .fold(
            0.0,
            (double previousValue, element) =>
                previousValue + (element.price * element.quantity))
        .reais();
  }

  @action
  void addItem({required ProductModel product}) {
    try {
      if (cartList.any((element) => element.id == product.id)) {
        final index =
            cartList.indexWhere((element) => element.id == product.id);
        cartList[index].quantity = cartList[index].quantity + 1;
      } else {
        cartList.add(CartModel(
            id: product.id,
            title: product.title,
            quantity: 1,
            price: product.price));
      }

      listSizeAndPriceSum();
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
      appStatus.message();
    }
  }

  @action
  void removeItem({required CartModel cartItem}) {
    cartList.remove(cartItem);
    listSizeAndPriceSum();
  }

  @action
  void clearCart() {
    cartList.clear();
    if (cartList.isEmpty) {
      appStatus = AppStatus.empty;
      listSizeAndPriceSum();
    }
  }

  @action
  void addItemQuantity({required CartModel cartItem}) {
    final index = cartList.indexOf(cartItem);
    cartList[index] = cartItem.copyWith(quantity: cartItem.quantity + 1);
    listSizeAndPriceSum();
  }

  @action
  void removeItemQuantity({required CartModel cartItem}) {
    final index = cartList.indexOf(cartItem);
    if (cartItem.quantity > 1) {
      cartList[index] = cartItem.copyWith(quantity: cartItem.quantity - 1);
      listSizeAndPriceSum();
    }
  }
}
