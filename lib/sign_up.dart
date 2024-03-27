import 'package:evoss/apis/products_api.dart';
import 'package:evoss/products.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserRegister> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  void registerUser() async {
    final user = User();
    print('ishladiiiiiiii');
    try {
      await user.registerUser(
        firstNameController.text,
        phoneNumberController.text,
        passwordController.text,
        confirmPassword.text,
      );
      // Handle success as needed
    } catch (e) {
      // Handle failure/error
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    controller: firstNameController,
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
                      hintText: 'First Name'
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: phoneNumberController,
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
                      hintText: 'Phone number'
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: passwordController,
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
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: confirmPassword,
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
                      hintText: 'Confirm Password', 
                    ),
                  ),
                ),
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
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push( 
                        context, 
                        MaterialPageRoute( 
                            builder: (context) => 
                               const  ProductList()));
                      registerUser();

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
          ),
        )
      )
    );
  }
}