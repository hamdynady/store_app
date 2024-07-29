import 'dart:convert';
import 'dart:js_interop_unsafe';

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetProductByCategory {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: ' https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> categoryProducts = [];
    for (int i = 0; i < data.length; i++) {
      categoryProducts.add(ProductModel.fromJson(data[i]));
    }
    return categoryProducts;
  }
}
