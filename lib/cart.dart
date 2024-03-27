// import 'package:flutter/material.dart';

// class Cart extends StatefulWidget {
//   const Cart({super.key});

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     if (11 % 2 == 0) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body:  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Your cart is empty', 
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green
//               ),
//             ),
//             const SizedBox(height: 8,),
//             const Text(
//               'Your cart is empty, Add your favourite food from menu', 
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 8,),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             width: 400,
//             height: 40,
//             decoration: BoxDecoration(
//               // color: Colors.green,
//               borderRadius: BorderRadius.circular(1000),
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 print('object');
//               },
//               child: const Text('data'),
//               ),
//           ),
//           ],
//         ),
//       )
//     );
//     }
//     else {
//       return  Scaffold(
//         appBar: AppBar(
//           title: const Text('Cart'),
//         ),
//         body: Center(
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Card(
//                   elevation: 2,
//                   child: Container(
//                     width: double.infinity,
//                     height: 130,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
                    
//                     ),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Image.asset(
//                               'assets/imgs/lavash.png', 
//                               height: 100, 
//                               width: 100,
//                             ),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                  Text(
//                                   'Lavash s govyadiny',
//                                   style: TextStyle(
//                                     fontSize: 18
//                                   ),
//                                 ),
//                                 Text(''),
//                                 Text(''),
//                                 Text(
//                                   '14 000',
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 27, 66, 28),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
                                
//                                 }, 
//                                 icon: const Icon(
//                                   Icons.delete, 
//                                   size: 18,
//                                   color: Colors.grey,
//                                 )
//                               ),
//                               const Text(''),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: (){

//                                     }, 
//                                     icon: const Icon(Icons.remove, color: Colors.green,)
//                                   ),
//                                   const Text('1'),
//                                   IconButton(
//                                     onPressed: (){

//                                     }, 
//                                     icon: const Icon(Icons.add, color: Colors.green,)
//                                   )
//                                 ],
//                               )
//                               ],
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),  
//               ),
//               Expanded(
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         child: SizedBox(
//                           height: 70,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15)
//                               ),      
//                             ),
//                             ),
//                             onPressed: (){
        
//                             }, 
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Oformit zakaz',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.add_task_outlined,
//                                   color: Colors.white,
//                                 )
//                               ],
//                             )
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// }
// import 'package:flutter/material.dart';

// class Cart extends StatefulWidget {
//   const Cart({Key? key}) : super(key: key);

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   List<String> items = ['Lavash s govyadiny']; // Sample item list
//   List<int> quantities = [1]; // Sample quantity list

//   void decrementQuantity(int index) {
//     if (quantities[index] > 1) {
//       setState(() {
//         quantities[index]--;
//       });
//     }
//   }

//   void incrementQuantity(int index) {
//     setState(() {
//       quantities[index]++;
//     });
//   }

//   void removeItem(int index) {
//     setState(() {
//       items.removeAt(index);
//       quantities.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: items.isEmpty ? _buildEmptyCart() : _buildCartWithItems(),
//     );
//   }

//   Widget _buildEmptyCart() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Your cart is empty',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Add your favorite food from the menu',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               // Action to navigate to the menu or perform any relevant action
//             },
//             child: const Text('Explore Menu'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCartWithItems() {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 2,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Image.asset(
//                     'assets/imgs/lavash.png',
//                     height: 400,
//                     width: 100,
//                   ),
//                   title: Text(
//                     items[index],
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                   subtitle: Text(
//                     'Quantity: ${quantities[index]}',
//                     style: const TextStyle(
//                       color: Color.fromARGB(255, 27, 66, 28),
//                     ),
//                   ),
//                   trailing: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // IconButton(
//                       //   onPressed: () => removeItem(index),
//                       //   icon: const Icon(
//                       //     Icons.delete,
//                       //     size: 18,
//                       //     color: Colors.grey,
//                       //   ),
//                       // ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             onPressed: () => decrementQuantity(index),
//                             icon: const Icon(Icons.remove, color: Colors.green),
//                           ),
//                           Text(quantities[index].toString()),
//                           IconButton(
//                             onPressed: () => incrementQuantity(index),
//                             icon: const Icon(Icons.add, color: Colors.green),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> items = ['Lavash s govyadiny']; // Sample item list
  List<int> quantities = [1]; // Sample quantity list

  void decrementQuantity(int index) {
    if (quantities[index] > 1) {
      setState(() {
        quantities[index]--;
      });
    }
  }

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
      quantities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: items.isEmpty ? _buildEmptyCart() : _buildCartWithItems(),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your favorite food from the menu',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Action to navigate to the menu or perform any relevant action
            },
            child: const Text('Explore Menu'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/imgs/lavash.png',
                    height: 100,
                    width: 100,
                  ),
                  title: Text(
                    items[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Quantity: ${quantities[index]}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 27, 66, 28),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => decrementQuantity(index),
                            icon: const Icon(Icons.remove, color: Colors.green),
                          ),
                          Text(quantities[index].toString()),
                          IconButton(
                            onPressed: () => incrementQuantity(index),
                            icon: const Icon(Icons.add, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Action to place the order
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'Oformit zakaz',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.add_task_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
