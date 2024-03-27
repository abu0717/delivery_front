import 'package:evoss/apis/products_api.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final dataDt;
  const Detail({
    super.key,
    required this.dataDt  
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String fullUrl = getUrl();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                fullUrl + widget.dataDt['img'],
                height: 250,
                width: double.infinity,
              ),
              Text(
               widget.dataDt['product_name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
              ),
              const SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.dataDt['product_price'].toString(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(10, 20)),

                                  backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                  ),
                                ),
                        onPressed: (){
                          
                        }, 
                  child: const Icon(Icons.remove, color: Colors.white,)
                ),
                const Text('1'),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(10, 20)),
                                  backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                  ),
                                ),
                  onPressed: (){

                  }, 
                  child: const Icon(Icons.add, color: Colors.white,)
                )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                child: const Text(
                  'description',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Text(widget.dataDt['product_description'])
            ],
          ),
        ),
      ),
    );
  }
}