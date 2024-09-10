import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, String> item;

 DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    item['image']!,
                    height: 300,
                   // fit: BoxFit.values,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                item['title']!,
                style: GoogleFonts.andadaPro(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Text('3.1', style: TextStyle(fontSize: 18,color: Colors.black)),
                  Text(' (2.1K+ review)', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '\$${item['price']}',
                style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Select Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['S', 'M', 'L', 'XL', 'XXL',].map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: false,
                    color: MaterialStatePropertyAll(black),
                    onSelected: (selected) {}
                    
                    
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Select Color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Colors.pink, Colors.blue, Colors.green, Colors.purple, Colors.orange].map((color) {
                  return ChoiceChip(
                    label: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    selected: false,
                    onSelected: (selected) {},
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {},
                   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(black),
                   ),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
