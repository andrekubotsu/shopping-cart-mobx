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
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("Total: ${widget.controller.priceSum}");
        }),
      ),
      body: widget.controller.cartList.isEmpty
          ? Center(child: Text("OPS! Seu carrinho está vazio"))
          : Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: widget.controller.cartList.length,
                  itemBuilder: (_, index) => Dismissible(
                    key: Key(widget.controller.cartList[index].id),
                    onDismissed: (direction) {
                      widget.controller.removeItem(
                          cartItem: widget.controller.cartList[index]);
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Icon(
                              Icons.delete_sweep,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    child: Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.controller.cartList[index].title),
                          IconButton(
                              onPressed: () {
                                widget.controller.addItemQuantity(
                                    cartItem:
                                        widget.controller.cartList[index]);
                              },
                              icon: Icon(Icons.add)),
                          Text(widget.controller.cartList[index].quantity
                              .toString()),
                          IconButton(
                              onPressed: () {
                                widget.controller.removeItemQuantity(
                                    cartItem:
                                        widget.controller.cartList[index]);
                              },
                              icon: Icon(Icons.remove)),
                          Text((widget.controller.cartList[index].price *
                                  widget.controller.cartList[index].quantity)
                              .reais()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
