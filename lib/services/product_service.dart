import 'dart:convert';

import 'package:http/http.dart' as http;
import '../modal/productModal.dart';

class ProductCall{
  Future<List<Product>> fetchProduct() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(uri);
    final List<dynamic> json = jsonDecode(response.body);
    final List<Product> fetchedProduct = json.map((e)=>Product.fromJson(e)).toList();
    return fetchedProduct ;
  }
}