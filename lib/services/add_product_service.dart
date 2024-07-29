import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String disc,
      required String cat,
      required String image}) async {
    Map<String, dynamic> data=  await Api().post(
        url: 'https://fakestoreapi.com/products',
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
