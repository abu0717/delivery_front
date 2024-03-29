import 'package:evos/data/datas.dart';
import 'package:flutter/material.dart';

class ProductDitail extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ditailData;
  const ProductDitail({
    super.key,
    required this.ditailData
  });

  @override
  State<ProductDitail> createState() => _ProductDitailState();
}

class _ProductDitailState extends State<ProductDitail> {

  String fullUrl = getDomainUrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, 'refreshing');
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(fullUrl + widget.ditailData['img']),
                Text(
                  widget.ditailData['product_name'],
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 63, 156, 66),
                    fontSize: 22,
                    fontFamily: 'Nunito',
                  ),
                ),
          
                const SizedBox(
                  height: 10,
                ),
          
                !Cart().getCart().firstWhere((element) => element['id'] == widget.ditailData['id'], orElse: () {return {};}).containsKey('quantity') ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.ditailData['product_price']} сум',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 63, 156, 66),
                        fontSize: 22,
                        fontFamily: 'Nunito'
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          var itemAdding = widget.ditailData;
                          itemAdding['quantity'] = 1; 
                          Cart().addToCart(itemAdding);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 63, 156, 66),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.ditailData['product_price']} сум',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 63, 156, 66),
                        fontSize: 22,
                        fontFamily: 'Nunito'
                      ),
                    ),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              var itemAdding = widget.ditailData;
                              Cart().removeFromCart(itemAdding);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 63, 156, 66),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Text(Cart().getCart().firstWhere((element) => element['id'] == widget.ditailData['id'])['quantity'].toString()),
                    
                        const SizedBox(width: 15),
                        
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              var itemAdding = widget.ditailData;
                              Cart().addToCart(itemAdding);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 63, 156, 66),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          
                const SizedBox(height: 20),
          
                const Text(
                  'Описание',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Nunito'
                  ),
                ),
          
                const SizedBox(height: 5),
          
                Container(
                  width: 75,
                  height: 3,
                  color: Colors.green,
                ),
          
                const SizedBox(
                  height: 20,
                ),
          
                Text(
                  widget.ditailData['product_description'].toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 84, 83, 83)
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}