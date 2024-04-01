import 'package:flutter/material.dart';
import 'package:evos/data/datas.dart';

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

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async { 
        Navigator.pop(context, 'refr');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, 'refr');
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 23,
              ),
            ),
          ),
          title: const Text('Корзина', style: TextStyle(fontFamily: 'Nunito'),),
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Cart().clearCart();
                  Navigator.pop(context, 'refr');
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5))
                ),
                child: const Icon(
                  Icons.close,
                  size: 23,
                ),
              ),
            )
          ],
        ),
      
        body: SafeArea(
          child: cartItems.isNotEmpty ? Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ваш заказ: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                        Text(
                          Cart().countTotalPrice().toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 60, 139, 63)
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 23,
                    ),

                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 79, 150, 82),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 10,
                              offset: Offset(0, 8)
                            )
                          ]
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Оформить заказ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),

                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )
              ],
            )
          ) : Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ой, пусто!',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color.fromARGB(255, 79, 156, 84),
                      fontSize: 24
                    ),
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  const Text(
                    'Ваша корзина пока пуста. Добавьте любимиое блюдо из меню',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Nunito'
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'refr');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 79, 150, 82),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.green,
                            blurRadius: 10,
                            offset: Offset(0, 8)
                          )
                        ]
                      ),
                      
                      child: const Text(
                        'Перейти в меню',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}