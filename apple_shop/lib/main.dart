import 'package:apple_shop/Buy.dart';
import 'package:flutter/material.dart';

import 'Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Products>> products() async {

    var productList = <Products>[];
    
    var p1 = Products(1, "MacBook Air", "macbookair.jpeg", 22.999);
    var p2 = Products(2, "MacBook Pro", "macbookpro.jpg", 39.999);
    var p3 = Products(3, "İphone 13",   "iphone.jpeg", 33.999);
    var p4 = Products(4, "İphone 11", "iphone11.jpg", 15.779);
    var p5 = Products(5, "İpad Pro", "ipadpro.jpeg", 7.999);
    var p6 = Products(6, "Apple Watch", "watch.jpeg", 5.999);

    productList.add(p1);
    productList.add(p2);
    productList.add(p3);
    productList.add(p4);
    productList.add(p5);
    productList.add(p6);

    return productList;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Technology Shop"),
      ),
      body:FutureBuilder<List<Products>>(
        future: products(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            var getProductsList = snapshot.data;

            return ListView.builder(
              itemCount: getProductsList!.length,
              itemBuilder: (context,indeks){
                var product = getProductsList[indeks];

                return GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyProduct(product: product)));
                  },
                  child: Card(
                    shadowColor: Colors.red,
                    child: Row(
                      children: [
                        SizedBox(width:150,height: 150,child: Image.asset("images/${product.product_images_name}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.product_name,style: TextStyle(fontSize: 25),),
                            SizedBox(height: 20,),
                            Text("${product.product_cost}\u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blueAccent),)
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,15,0),
                          child: Icon(Icons.shopping_basket),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }
}
