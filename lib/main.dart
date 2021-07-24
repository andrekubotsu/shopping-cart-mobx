import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xFFF7F7F7),
      ),
      home: MyHomePage(title: 'Mobx Shopping Cart'),
      debugShowCheckedModeBanner: false,
    );
  }
}
