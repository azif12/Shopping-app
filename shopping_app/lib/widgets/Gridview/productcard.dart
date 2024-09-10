import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  const ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '€${price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
);}
}