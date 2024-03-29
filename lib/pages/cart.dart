import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evos/data/datas.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  var cartItems = Cart().getCart();
  var getUrl = getDomainUrl();
  

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async { 
        print('Back Button');
        Navigator.pop(context, 'refr');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, 'refr');
            },
            child: Icon(Icons.arrow_back_ios)
          ),
          title: Text('Cart'),
        ),
      
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 232, 235, 235),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            height: 120,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 17
                            ),
                          
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Image.network(getUrl + cartItems[index]['img'])
                                ),
                          
                                const SizedBox(
                                  width: 5,
                                ),
                          
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cartItems[index]['product_name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Nunito',
                                                fontSize: 17,
                                                // overflow: TextOverflow.ellipsis
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                          
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Cart().deleteItem(cartItems[index]);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                  
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cartItems[index]['product_price'].toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: Color.fromARGB(255, 51, 116, 53)
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    Cart().removeFromCart(cartItems[index]);                                            
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Color.fromARGB(255, 45, 100, 46),
                                                ),
                                              ),
                          
                                              const SizedBox(
                                                width: 9,
                                              ),
                          
                                              Text(
                                                cartItems[index]['quantity'].toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                          
                                              const SizedBox(
                                                width: 9,
                                              ),
                          
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    Cart().addToCart(cartItems[index]);                                    
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(255, 45, 100, 46),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  child: const Text('Hola'),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}