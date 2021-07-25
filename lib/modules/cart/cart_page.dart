import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shopping_cart/modules/cart/widgets/cart_card.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Meu carrinho:",
              style: TextStyle(color: AppColors.black),
            ),
            IconButton(
                onPressed: () {
                  widget.controller.clearCart();
                },
                icon: Icon(
                  Icons.remove_shopping_cart,
                  color: AppColors.black,
                ))
          ],
        ),
        backgroundColor: AppColors.lightGrey,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      body: widget.controller.cartList.isEmpty
          ? Center(child: Text("Ops! Seu carrinho está vazio"))
          : Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, right: 12.0, bottom: 85),
                  child: ListView.builder(
                      itemCount: widget.controller.cartList.length,
                      itemBuilder: (_, index) => CartCartCustomWidget(
                          controller: widget.controller, index: index)),
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
