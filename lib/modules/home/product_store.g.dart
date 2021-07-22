// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on ProductStoreBase, Store {
  final _$productListAtom = Atom(name: 'ProductStoreBase.productList');

  @override
  List<ProductModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<ProductModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$cartListAtom = Atom(name: 'ProductStoreBase.cartList');

  @override
  List<ProductModel> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(List<ProductModel> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  final _$getProductAsyncAction = AsyncAction('ProductStoreBase.getProduct');

  @override
  Future<void> getProduct() {
    return _$getProductAsyncAction.run(() => super.getProduct());
  }

  final _$ProductStoreBaseActionController =
      ActionController(name: 'ProductStoreBase');

  @override
  void addProductToCart(ProductModel product) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.addProductToCart');
    try {
      return super.addProductToCart(product);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList},
cartList: ${cartList}
    ''';
  }
}
