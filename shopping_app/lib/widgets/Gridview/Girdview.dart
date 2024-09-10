import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/Gridview/productcard.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Black Shirt",
      "price": 112.99,
      "image": "assests/images/black.jpg",
    },
    {
      "name": "Jeans",
      "price": 320.99,
      "image": "assests/images/img1.jpeg",
    },
    {
      "name": "Blue Shirt",
      "price": 113.99,
      "image": "assests/images/img2.jpg",
    },
    {
      "name": "Black Pant",
      "price": 178.99,
      "image": "assests/images/img3.jpg",
    },
    {
      "name": "White Shirt",
      "price": 178.99,
      "image": "assests/images/img4.jpg",
    },
     {
      "name": "Black Jeans",
      "price": 178.99,
      "image": "assests/images/img5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
         physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            imageUrl: product['image'],
          );
        },
      ),
    );
  }
}
