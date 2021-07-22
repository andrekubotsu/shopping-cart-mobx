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
  void initState() {
    store.getProduct();
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
      ),
      body: ListView.builder(
        itemCount: store.productList.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: InkWell(
            onTap: () {},
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
                    Text(store.productList[index].id),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(store.productList[index].title),
                        Text(store.productList[index].description),
                      ],
                    ),
                    Text(store.productList[index].price.toString())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
