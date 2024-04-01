import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String fullUrl = '192.168.1.2:8000';

List<dynamic> userCart = [];

class Cart {

  List<dynamic> getCart() {
    return userCart;
  }

  void addToCart(item){
    var z = userCart.firstWhere((element) => element['id'] == item['id'], orElse: () => {});
    if (z.isNotEmpty) {
      z['quantity'] += 1;
    } else {
      userCart.add(item);
    }
    // print(userCart);
  }

  void removeFromCart(item){
    var z = userCart.firstWhere((element) => element['id'] == item['id'], orElse: () => {});
    if (z['quantity']-1 != 0) {
      z['quantity'] -= 1;
    } else {
      userCart.remove(item);
    }
  }

  void deleteItem(item) {
    userCart.remove(item);
  }

  void clearCart() {
    userCart.clear();
  }

  String countTotalPrice() {
    int totalPrice = 0;
    for (Map<String, dynamic> item in userCart) {
      int i = item["product_price"] * item["quantity"];
      totalPrice += i;
    }
    return totalPrice.toString();
  }
}

class Auth {
  makeAuth(username, password) async {
    var url = Uri.http(fullUrl, '/auth/token/login/');
    var data = {
      "username": username,
      "password": password,
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    String body = json.encode(data);
    var response = await http.post(url, body: body, headers: headers);
    final token = jsonDecode(response.body);
    if (!token.containsKey('non_field_errors')) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token['auth_token']);
    }
    return token;
  }

  static Future<String?> getRA() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

getDomainUrl() {
  return 'http://$fullUrl';
}

class ProductCategory {
  Future<List<dynamic>> getCategories() async {
    var url = Uri.http(fullUrl, 'Category/');
    var response = await http.get(url);
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}