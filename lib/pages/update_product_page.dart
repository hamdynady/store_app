import 'package:flutter/material.dart';
import 'package:store/component/custom_button.dart';
import 'package:store/component/custom_textfield.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update page';

  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            labelText: 'Product Name',
            onChanged: (data) {
              name = data;
            },
          ),
          CustomTextField(
              labelText: 'description',
              onChanged: (data) {
                desc = data;
              }),
          CustomTextField(
            labelText: 'price',
            onChanged: (data) {
              price = data!;
            },
            Keyboard: TextInputType.number,
          ),
          CustomTextField(
              labelText: 'image',
              onChanged: (data) {
                image = data;
              }),
          SizedBox(height: 50),
          CustomButton(
            buttonName: 'Update',
            onTab: () async {
              isLoading = true;
              setState(() {});
              try {
                await customUpdate(product);
                print('success');
              } catch (e) {
                print(e.toString());
              }
              isLoading = false;
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Future<void> customUpdate(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: name != null ? name! : product.title,
      price: price != null ? price! : product.price.toString(),
      disc: desc != null ? desc! : product.description,
      image: image != null ? image! : product.image,
      cat: product.category,
      id: product.id,
    );
  }
}
