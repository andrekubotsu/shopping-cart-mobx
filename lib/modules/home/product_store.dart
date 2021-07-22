import 'package:mobx/mobx.dart';
import 'package:shopping_cart/shared/models/product_model.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  // @observable
  // ProductModel _product =
  //     ProductModel(id: "", title: "", description: "", price: 0.0);

  @observable
  List<ProductModel> productList = [];

  @observable
  List<ProductModel> cartList = [];

  // @action
  // void setProduct(ProductModel product) {
  //   _product.id = product.id;
  //   _product.title = product.title;
  //   _product.description = product.description;
  //   _product.price = product.price;
  // }

  @action
  Future<void> getProduct() async {
    final list = List.generate(
      20,
      (index) => ProductModel(
          id: "id$index",
          title: "Produto $index",
          description: "Descrição $index",
          price: index * 10),
    );
    productList.addAll(list);
  }

  @action
  void addProductToCart(ProductModel product) {
    final productsAdded = cartList;
    productsAdded.add(product);
  }
}
