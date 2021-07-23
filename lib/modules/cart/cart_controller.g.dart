// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  final _$appStatusAtom = Atom(name: '_CartControllerBase.appStatus');

  @override
  AppStatus get appStatus {
    _$appStatusAtom.reportRead();
    return super.appStatus;
  }

  @override
  set appStatus(AppStatus value) {
    _$appStatusAtom.reportWrite(value, super.appStatus, () {
      super.appStatus = value;
    });
  }

  final _$cartListAtom = Atom(name: '_CartControllerBase.cartList');

  @override
  ObservableList<CartModel> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableList<CartModel> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  final _$listLengthAtom = Atom(name: '_CartControllerBase.listLength');

  @override
  String get listLength {
    _$listLengthAtom.reportRead();
    return super.listLength;
  }

  @override
  set listLength(String value) {
    _$listLengthAtom.reportWrite(value, super.listLength, () {
      super.listLength = value;
    });
  }

  final _$priceSumAtom = Atom(name: '_CartControllerBase.priceSum');

  @override
  String get priceSum {
    _$priceSumAtom.reportRead();
    return super.priceSum;
  }

  @override
  set priceSum(String value) {
    _$priceSumAtom.reportWrite(value, super.priceSum, () {
      super.priceSum = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void listSizeAndPriceSum() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.listSizeAndPriceSum');
    try {
      return super.listSizeAndPriceSum();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem({required ProductModel product}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addItem');
    try {
      return super.addItem(product: product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem({required CartModel cartItem}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeItem');
    try {
      return super.removeItem(cartItem: cartItem);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItemQuantity({required CartModel cartItem}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addItemQuantity');
    try {
      return super.addItemQuantity(cartItem: cartItem);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItemQuantity({required CartModel cartItem}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeItemQuantity');
    try {
      return super.removeItemQuantity(cartItem: cartItem);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appStatus: ${appStatus},
cartList: ${cartList},
listLength: ${listLength},
priceSum: ${priceSum}
    ''';
  }
}
