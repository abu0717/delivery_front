import 'package:evos/data/datas.dart';
import 'package:evos/pages/navigator.dart';
import 'package:evos/pages/user_login.dart';
import 'package:flutter/material.dart';

void main() {
  // Ensure that Flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();
  // Run the app.
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // ignore: prefer_typing_uninitialized_variables
  var routingPage;

  @override
  void initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  Future<void> checkAuthAndNavigate() async {
    String? authToken = await Auth.getRA();
    setState(() {
      routingPage = authToken != null ? const BottomBar() : const UserLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: routingPage,
    );
  }
}
