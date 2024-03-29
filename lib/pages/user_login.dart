import 'package:evos/data/datas.dart';
import 'package:evos/pages/navigator.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String error = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const Icon(Icons.lock, size: 100,),
              const SizedBox(height: 50,),
              Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(color: Colors.grey[700],
                fontSize: 16,
              ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                     filled: true,
                    hintText: 'Username'
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                     filled: true,
                    hintText: 'Password', 
                  ),
                ),
              ),

              error.isNotEmpty ?
               Text(
                error,
                style: TextStyle(
                  color: Colors.red
                ),
              ) : const SizedBox(),

              const SizedBox(height: 25,),
              Container(
                padding: const EdgeInsets.all(25),
                height: 100,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                    ),
                  ),
                  onPressed: () async {
                    var tkn = await Auth().makeAuth(usernameController.text, passwordController.text);
                    if (tkn.containsKey('non_field_errors')) {
                      setState(() {
                        error = 'Username or Pssword is Incorrect';
                      });
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => const BottomBar()));
                    }
                  }, 
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ),
              )
            ],
          ),
        )
      )
    );
  }
}