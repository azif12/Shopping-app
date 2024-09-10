import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int pulloverQuantity = 1;
  int coatQuantity = 1;
  double pulloverPrice = 320.99;
  double coatPrice = 113.99;
  double shipping = 25.99;

  @override
  Widget build(BuildContext context) {
    double subTotal =
        (pulloverPrice * pulloverQuantity) + (coatPrice * coatQuantity);
    double total = subTotal + shipping;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Icon(Icons.arrow_back),
                ),
                color: black,
                onPressed: () => Navigator.pop(context)),
            Padding(
              padding: const EdgeInsets.only(right: 140.0),
              child: Text('My Cart ',
                  style: TextStyle(color: black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                children: [
                  Image.asset('assests/images/black.jpg',
                      width: 80, height: 80, fit: BoxFit.cover),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pullover Sleeveless',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black)),
                        SizedBox(height: 8),
                        Text('€${pulloverPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.amber[900])),
                        SizedBox(height: 15),
                        Text(
                          'Size = XL',
                          style: TextStyle(color: Colors.black38),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (pulloverQuantity > 1) {
                                  setState(() {
                                    pulloverQuantity--;
                                  });
                                }
                              },
                            ),
                            Text(pulloverQuantity.toString(),
                                style: TextStyle(fontSize: 16)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  pulloverQuantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Image.asset('assests/images/black.jpg',
                      width: 80, height: 80, fit: BoxFit.cover),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Black Coat',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black)),
                        SizedBox(height: 8),
                        Text('€${coatPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.amber[900])),
                        SizedBox(height: 15),
                        Text(
                          'Size = XL',
                          style: TextStyle(color: Colors.black38),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (coatQuantity > 1) {
                                  setState(() {
                                    coatQuantity--;
                                  });
                                }
                              },
                            ),
                            Text(coatQuantity.toString(),
                                style: TextStyle(fontSize: 16)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  coatQuantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Promo/Student Code or Vouchers',
                      style: TextStyle(
                          fontSize: 16,
                          color: black,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub Total',
                            style: TextStyle(fontSize: 16, color: black)),
                        Text('€${subTotal.toStringAsFixed(2)}',
                            style:
                                TextStyle(fontSize: 16, color: Colors.amber)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping',
                            style: TextStyle(fontSize: 16, color: black)),
                        Text('€${shipping.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: black)),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black)),
                        Text('€${total.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 400,
                child: Padding(
                    padding: const EdgeInsets.only(top: 65.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Checkout', style: TextStyle(fontSize: 12,color: Colors.white)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(black)))),
              ),
            ])));
  }
}
