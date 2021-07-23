import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (_) {
          if (widget.controller.list.isEmpty) {
            return Center(child: Text("OPS! Seu carrinho está vazio"));
          } else {
            return ListView.builder(
              itemCount: widget.controller.list.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(widget.controller.list[index].title),
                trailing: Text(widget.controller.list[index].price.reais()),
                onTap: () {},
              ),
            );
          }
        },
      ),
    );
  }
}
