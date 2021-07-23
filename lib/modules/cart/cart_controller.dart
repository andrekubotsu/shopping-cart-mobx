import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/shared/models/product_model.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  String errorMessage = "";

  @observable //observar aquilo que influencia na renderizção
  AppStatus appStatus = AppStatus.empty;

  final list = <ProductModel>[];

  @observable
  String listLength = "0";

  @action
  void addItem(ProductModel product) {
    try {
      list.add(product);
      listLength = list.length.toString();
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
      appStatus.message(); //chamando a função criada na extension
    }
  }
}
