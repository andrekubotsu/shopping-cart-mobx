import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_cart/modules/cart/cart_controller.dart';
import 'package:shopping_cart/modules/home/home_controller.dart';
import 'package:shopping_cart/shared/constants/app_colors.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';

class HomeCardCustomWidget extends StatefulWidget {
  final HomeController homeController;
  final CartController cartController;
  final int index;
  HomeCardCustomWidget({
    Key? key,
    required this.homeController,
    required this.cartController,
    required this.index,
  }) : super(key: key);

  @override
  _HomeCardCustomWidgetState createState() => _HomeCardCustomWidgetState();
}

class _HomeCardCustomWidgetState extends State<HomeCardCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.cartController
            .addItem(product: widget.homeController.products[widget.index]);
      },
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightBlue,
                maxRadius: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.homeController.products[widget.index].title,
                style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.homeController.products[widget.index].price.reais(),
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
