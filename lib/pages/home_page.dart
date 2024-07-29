import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/product_service.dart';
import 'package:store/widgets/item_card.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('New Trend'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No items found'));
            }else {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) => ItemCard(product: products[index],),
              );
            }
          },
        ),
      ),
    );
  }
}