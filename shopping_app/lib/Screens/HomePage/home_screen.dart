import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_app/Models%20List/catergorylist.dart';
import 'package:shopping_app/Screens/SearchPage/SearchPage.dart';
import 'package:shopping_app/widgets/Gridview/Girdview.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined,
                  size: 28, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: 150.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Find you ',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Style',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.amber[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text(
                  'Be more beautiful with our suggestions :)',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(height: 15),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('offerdetails').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final List<DocumentSnapshot> offerDocuments = snapshot.data!.docs;
                  return SizedBox(
                    height: 150,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 150.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      itemCount: offerDocuments.length,
                      itemBuilder: (context, index, realIdx) {
                        final Map<String, dynamic> data = offerDocuments[index].data() as Map<String, dynamic>;
                        return GestureDetector(
                          onTap: () {
                            // Handle onTap for carousel items
                            print("Tapped on item index: $index");
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(data['image'][0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorylist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(categorylist[index]['image']),
                          ),
                          Text(categorylist[index]['name'],
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Productdetails').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final List<DocumentSnapshot> itemDocuments = snapshot.data!.docs;
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 350.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      itemCount: itemDocuments.length,
                      itemBuilder: (context, index, realIdx) {
                        final Map<String, dynamic> data = itemDocuments[index].data() as Map<String, dynamic>;
                        return GestureDetector(
                          onTap: () {
                            print("Tapped on item index: $index");
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(data['image'][0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20.0),
                                    ),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   data['title'],
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 18,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      RichText(
                                        text: TextSpan(
                                          text: '\$',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.orange[600],
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: data['price'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Most Popular',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('see all',
                            style: TextStyle(color: Colors.blue)))
                  ],
                ),
              ),
              GridWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
