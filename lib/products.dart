import 'package:evoss/apis/products_api.dart';
import 'package:evoss/cart.dart';
import 'package:evoss/detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> data = [];
  String fullUrl = getUrl();
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }
  int current_tab = 0;
  Widget currentScreen = ProductList();

  fetchProduct() async {
    var dt = await ProductApi().fetchProduct();
    setState(() {
      data = dt;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        "EVOS",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            
          },
          icon: const Icon(Icons.refresh),
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding:  EdgeInsets.only(left: 8),
            child: Text(
              'Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 120,
                  height: 150,
                  child: Card(
                    elevation: 3,
                    surfaceTintColor: Colors.white,
                    child: Container(
                      width: 120,
                      height: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network('${data[index]['img']}'),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            flex: 0,
                            child: Text(
                              "${data[index]['category_name']}",
                              style: const TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              'Lavash',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              print(data.length);
              return GridView.builder(
                shrinkWrap: true,
                itemCount: data[index]['product'].length, // Update the itemCount to match the length of the product list
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, productIndex) {
                  return GestureDetector(
                    onTap: () {
                      print(data[index]['product'][productIndex]);
                      Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => 
                        Detail(
                          dataDt: data[index]['product'][productIndex],
                        )
                        )
                      );
                    }, 
                    child: Card(
                      
                      elevation: 10,
                      surfaceTintColor: Colors.white,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image.network(fullUrl + data[index]['product'][productIndex]['img'])),
                            const SizedBox(height: 8),
                            Text(
                              "${data[index]['product'][productIndex]['product_name']}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.only(right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('object');
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.green),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            topLeft: Radius.zero,
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(Icons.add_rounded, color: Colors.white),
                                  ),
                                  Text(
                                    "${data[index]['product'][productIndex]['product_price']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 33, 72, 34),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: (){},
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/imgs/evos.png'),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar:  BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 20,
      child: Container(
        height: 60,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const ProductList();
                      current_tab = 0;
                    });
                  },
                  child:  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: current_tab == 0 ? Colors.green : Colors.grey,
                        size: 33, 
                      ),
                      Text('Home', style: TextStyle(
                        color: current_tab == 0 ? Colors.green : Colors.grey,
                      ),)
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      // currentScreen = const Cart();
                      current_tab = 1;
                    }); 
                  },
                  child:  Column( 
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        color: current_tab == 1 ? Colors.green : Colors.grey,
                        size: 33, 
                      ),
                      Text('', style: TextStyle(
                        color: current_tab == 1 ? Colors.green : Colors.grey,
                      ),
                      ),
                    ],
                  ),
                ),  
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      // currentScreen = const Cart();
                      current_tab = 2;
                    }); 
                  },
                  child:  Column( 
                    children: [
                      Icon(
                        Icons.account_box,
                        color: current_tab == 2 ? Colors.green : Colors.grey,
                        size: 33, 
                      ),
                      Text('', style: TextStyle(
                        color: current_tab == 2 ? Colors.green : Colors.grey,
                      ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const Cart();
                      current_tab = 3;
                    }); 
                  },
                  child:  Column( 
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Cart()
                          )
                        );
                      },
                      icon: Icon(Icons.shopping_cart))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
}
