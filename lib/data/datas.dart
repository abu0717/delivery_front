import 'dart:convert';

import 'package:http/http.dart' as http;

String fullUrl = '192.168.1.2:8000';

List<dynamic> userCart = [];

class Cart {

  List<dynamic> getCart() {
    return userCart;
  }

  void addToCart(item){
    var z = userCart.firstWhere((element) => element['id'] == item['id'], orElse: () => {});
    if (z.isNotEmpty) {
      userCart[userCart.indexOf(item)]['quantity'] += 1;
    } else {
      userCart.add(item);
    }
    print(userCart);
  }

  void removeFromCart(item){
    userCart.remove(item);
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