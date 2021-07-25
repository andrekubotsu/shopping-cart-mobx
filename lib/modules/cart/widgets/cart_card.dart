import 'package:flutter/material.dart';
import 'package:shopping_cart/shared/constants/app_colors.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';
import '../cart_controller.dart';

class CartCartCustomWidget extends StatefulWidget {
  final CartController controller;
  final int index;
  const CartCartCustomWidget(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  _CartCartCustomWidgetState createState() => _CartCartCustomWidgetState();
}

class _CartCartCustomWidgetState extends State<CartCartCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.controller.cartList[widget.index].id),
      onDismissed: (direction) {
        widget.controller
            .removeItem(cartItem: widget.controller.cartList[widget.index]);
      },
      background: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete_sweep,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Retirar do carrinho!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.delete_sweep,
                color: AppColors.black.withOpacity(0.5),
                size: 30,
              ),
              CircleAvatar(
                backgroundColor: AppColors.lightBlue,
                maxRadius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.controller.cartList[widget.index].title,
                    style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (widget.controller.cartList[widget.index].price *
                            widget.controller.cartList[widget.index].quantity)
                        .reais(),
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        widget.controller.removeItemQuantity(
                            cartItem: widget.controller.cartList[widget.index]);
                      },
                      icon: Icon(Icons.remove)),
                  Text(
                    widget.controller.cartList[widget.index].quantity
                        .toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.controller.addItemQuantity(
                            cartItem: widget.controller.cartList[widget.index]);
                      },
                      icon: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
