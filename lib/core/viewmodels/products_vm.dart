import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm/core/models/product.dart';

class ProductVM{
 Future<List<Product>> getProductFromServer() async{
    Dio d = Dio();
    Response result = await d.get('https://dummyjson.com/products');
    List<dynamic> allProducts = result.data['products'];
    List<Product> productsList = allProducts.map((i)=> Product.fromAPI(i)).toList();
    return productsList;
  }
}