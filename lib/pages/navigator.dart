import 'package:evos/pages/cart.dart';
import 'package:evos/pages/products.dart';
import 'package:evos/pages/test.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int currentTap = 0;
  final List<Widget> screens = [
    const ProductsPage(),
    const Testing(),
    const CartPage()
  ];

  @override
  void initState() {
    super.initState();
    currentScreen = screens[currentTap];
  }


  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ProductsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket, 
        child: currentScreen
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 63, 179, 45).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: Transform.rotate(
              angle: -0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image.asset('assets/bottom_bar_logo.jpg')),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        surfaceTintColor: const Color.fromARGB(255, 230, 229, 229),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const ProductsPage();
                      currentTap = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        size: 25,
                        color: currentTap == 0 ? Colors.green : Colors.grey,
                      ),
        
                      currentTap == 0 ? const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ) : const SizedBox()
                    ],
                  ),
                ),
                
                const SizedBox(
                  width: 12,
                ),
                
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const Testing();
                      currentTap = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.document_scanner,
                        size: 25,
                        color: currentTap == 1 ? Colors.green : Colors.grey,
                      ),
                      currentTap == 1 ? const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ) : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
        
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
        
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 25,
                        color: currentTap == 2 ? Colors.green : Colors.grey,
                      ),
                      currentTap == 2 ? const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ) : const SizedBox()
                    ],
                  ),
                ),
        
                const SizedBox(
                  width: 12,
                ),
        
                MaterialButton(
                  minWidth: 40,
                  onPressed: () async {
                    setState(() {
                      currentScreen = const CartPage();
                      currentTap = 3;
                    });
                    String? refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage()
                      )
                    );
                    if (refresh == 'refr') {
                      setState(() {
                        currentScreen = const ProductsPage();
                        currentTap = 0;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 25,
                        color: currentTap == 3 ? Colors.green : Colors.grey,
                      ),
                      currentTap == 3 ? const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ) : const SizedBox()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}