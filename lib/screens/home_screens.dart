import 'package:flutter/material.dart';
import 'package:product/screens/product_description.dart';
import 'package:product/services/product_service.dart';
import 'package:flutter_product_card/flutter_product_card.dart';
import '../modal/productModal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<String> cat = ["electronics","jewelery","men's clothing","women's clothing"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Store'),centerTitle: true,),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            final Product product = products[index];
            final String image = product.image;
            final String title = product.title;
            final double price = product.price.toDouble();
            final String description = product.description;
            final String category = product.category;
            return Container(
              padding: const EdgeInsets.all(8),
              child: ProductCard(
                borderRadius: 20,
                imageUrl: image,
                categoryName: category,
                productName: title,
                price: price,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDescription(
                            image: image,title: title,description: description,price: price,
                          )
                      )
                  );
                },
              ),
            );
          }),
    );
  }

  Future<void> fetchProduct() async{
    final response = await ProductCall().fetchProduct();
    setState(() {
      products = response;
    });
  }
}
