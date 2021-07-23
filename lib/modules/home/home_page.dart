import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/modules/cart/cart_controller.dart';
import 'package:shopping_cart/modules/cart/cart_page.dart';
import 'package:shopping_cart/modules/home/home_controller.dart';
import 'package:shopping_cart/shared/utils/extensions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();
  final cartController = CartController();
  ReactionDisposer? disposer;

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CartPage(
                              controller: cartController,
                            )));
              },
              icon: Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Observer(builder: (_) {
                      return CircleAvatar(
                        radius: 9,
                        child: Text(
                          cartController.listLength,
                          style: TextStyle(fontSize: 8),
                        ),
                      );
                    }),
                  )
                ],
              ))
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.appStatus == AppStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.appStatus == AppStatus.success) {
            return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: InkWell(
                  onTap: () {
                    cartController.addItem(product: controller.products[index]);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(controller.products[index].id),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.products[index].title),
                              Text(controller.products[index].description),
                            ],
                          ),
                          Text(controller.products[index].price.reais())
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (controller.appStatus == AppStatus.empty) {
            return Center(
              child: Text("Produtos indisponíveis no momento"),
            );
          } else if (controller.appStatus == AppStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Houve um problema!"),
                  Text(controller.errorMessage),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Produtos indisponíveis no momento"),
            );
          }
        },
      ),
    );
  }
}
