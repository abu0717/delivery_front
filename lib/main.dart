// import 'package:evos_clone/detail.dart';
import 'package:evoss/cart.dart';
import 'package:evoss/products.dart';
import 'package:evoss/sign_up.dart';
// import 'package:evos_clone/sign_up.dart';
// import 'package:evos_clone/user_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }  
}