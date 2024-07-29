import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProductService{
  Future<ProductModel> updateProduct(
      {required String title,
        required String price,
        required String disc,
        required String cat,
        required String image,
      required int id,
      }) async {
    print('product id = $id');
    Map<String, dynamic> data=  await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': disc,
        'category': cat,
        'image': image,
      },
    );

    return ProductModel.fromJson(data);
  }
}