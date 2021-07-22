import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:shopping_cart/modules/home/product_store.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = ProductStore();

  ReactionDisposer? disposer;

  @override
  void initState() async {
    await store.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: store.productList.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(store.productList[index].id),
                Text(store.productList[index].title),
                Text(store.productList[index].description),
                Text(store.productList[index].price.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
