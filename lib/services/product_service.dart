import 'dart:convert';

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;
class AllProductsService{
  Future<List<ProductModel>> getAllProducts() async{
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products');

      List<ProductModel> products = [];
      for (int i = 0; i < data.length; i++) {
        products.add(ProductModel.fromJson(data[i]));
      }
      return products;

  }
}