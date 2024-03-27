import 'dart:convert';

import 'package:http/http.dart' as http;

String domain = '192.168.100.107:8000';

class ProductApi {
  Future<List<dynamic>> fetchProduct() async {
    print('fetch products called');
    final uri = Uri.http(domain, 'Category');
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body); 
    return json;
  }
}


String getUrl() {
  return 'http://$domain';
}

class User {
  Future<void> registerUser(String firstName, String phoneNumber, String password, String confirmPassword) async {
    final url = Uri.http(domain, 'users/');
  
      final response = await http.post(
        url,
        body: jsonEncode({
          'first_name': firstName,
          'phone_number': phoneNumber,
          'password': password,
          'confirm_password': confirmPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print(response.body);
  }
}


