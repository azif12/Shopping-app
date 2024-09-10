import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/Gridview/Girdview.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30, color: Colors.black),
            onPressed: () {
              TextFormField();
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
      drawer: Drawer(
        width: 300,
        elevation: 0,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            GridWidget(),
          ],
        ),
      ),
    );
  }
}
