import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shopping_cart/shared/constants/app_colors.dart';
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
        backgroundColor: AppColors.lightGrey,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      body: widget.controller.cartList.isEmpty
          ? Center(child: Text("Ops! Seu carrinho está vazio"))
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
      bottomSheet: Observer(builder: (_) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.controller.priceSum,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Finalizar a compra"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.blue)),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
