import 'package:evos/data/datas.dart';
import 'package:evos/pages/product_ditail.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<dynamic> categories = [];
  String domain = getDomainUrl();

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    var dt = await ProductCategory().getCategories();
    setState(() {
      categories = dt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: Image.asset('assets/evos.png'),
                  ),
                  const SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.green,
                          size: 24,
                        ),
                        Expanded(
                          child: Text(
                            'Олой бозор турик Коча',
                            style: TextStyle(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Категория',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 63, 156, 66),
                          fontFamily: 'Nunito'
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 115,
                              child: Card(
                                surfaceTintColor: const Color.fromARGB(255, 230, 229, 229),
                                elevation: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Image.network(categories[index]['category_img']),
                                    ),
                                    Text(
                                      categories[index]['category_name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Nunito'
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.green,
                                            blurRadius: 2,
                                          ),
                                        ],
                                        color: Color.fromARGB(255, 63, 156, 66),
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return categories[index]['product'].isNotEmpty ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              const SizedBox(
                                height: 18,
                              ),

                              Text(
                                categories[index]['category_name'],
                                style: const TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 63, 156, 66),
                                  fontFamily: 'Nunito'
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 200
                                ),
                                itemCount: categories[index]['product'].length,
                                itemBuilder: (cont, i) {
                                  return SizedBox(
                                    child: Card(
                                      elevation: 6,
                                      surfaceTintColor: const Color.fromARGB(255, 230, 229, 229),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(17.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    String pushing = await Navigator.push(context, MaterialPageRoute(builder: (builer) => ProductDitail(ditailData: categories[index]['product'][i],)));
                                                    if (pushing == 'refreshing') {
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Image.network(domain + categories[index]['product'][i]['img'])
                                                ),
                                                Text(
                                                  categories[index]['product'][i]['product_name'],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromARGB(255, 31, 31, 31),
                                                    fontFamily: 'Nunito'
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          
                                          if (!Cart().getCart().firstWhere((element) => element['id'] == categories[index]['product'][i]['id'], orElse: () {return {};}).containsKey('quantity')) Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    var itemAdding = categories[index]['product'][i];
                                                    itemAdding['quantity'] = 1; 
                                                    Cart().addToCart(itemAdding);
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                                                  decoration: const BoxDecoration(
                                                    color: Color.fromARGB(255, 63, 156, 66),
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(17), bottomLeft: Radius.circular(17))
                                                  ),
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  )
                                                ),
                                              ),

                                              Container(
                                                margin: const EdgeInsets.only(right: 12),
                                                child: Text(
                                                  categories[index]['product'][i]['product_price'].toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(255, 57, 167, 61),
                                                    fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                              )
                                            ],
                                          ) else Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 73,
                                                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(255, 63, 156, 66),
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(17), bottomLeft: Radius.circular(17))
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          var itemAdding = categories[index]['product'][i];
                                                          Cart().removeFromCart(itemAdding);
                                                        });
                                                      },
                                                      child: const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),

                                                    Text(
                                                      Cart().getCart().firstWhere((element) => element['id'] == categories[index]['product'][i]['id'])['quantity'].toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),

                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          var itemAdding = categories[index]['product'][i];
                                                          Cart().addToCart(itemAdding);
                                                        });
                                                      },
                                                      child: const Text(
                                                        '+',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ),

                                              Container(
                                                margin: const EdgeInsets.only(right: 12),
                                                child: Text(
                                                  categories[index]['product'][i]['product_price'].toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(255, 57, 167, 61),
                                                    fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ),
                                  );
                                },
                              ),
                            ],
                          ) : Container();
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
