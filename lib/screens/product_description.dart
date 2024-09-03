import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final price;
  ProductDescription({super.key,required this.image,required this.title,required this.description,required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Description'),),
      body: Container(
        color: Colors.white54,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: ListView(
            children: [
              Image.network(
                image,
                fit: BoxFit.fill,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(description),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(price.toString(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Cart'))),
                  SizedBox(width: 5,),
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Buy Now')))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}