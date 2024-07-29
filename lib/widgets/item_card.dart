
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/update_product_page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 8,right: 8,left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(
                      product.title,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                       maxLines: 2,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          r'$''${product.price.toString()}',
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -65,
            right: 32,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
