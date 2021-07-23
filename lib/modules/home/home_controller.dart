import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/shared/models/product_model.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = "";

  @observable //observar aquilo que influencia na renderizção
  AppStatus appStatus = AppStatus.empty;

  List<ProductModel> products = <ProductModel>[];

  @action
  Future<void> getProducts() async {
    try {
      appStatus = AppStatus.loading;
      products = await Future.delayed(Duration(seconds: 2)).then(
        (value) => List.generate(
          50,
          (index) => ProductModel(
              id: "id$index",
              title: "Produto $index",
              description: "Descrição $index",
              price: (5.00 * index)),
        ),
      );
      appStatus = products.isNotEmpty ? AppStatus.success : AppStatus.empty;
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
      appStatus.message(); //chamando a função criada na extension
    }
  }
}
