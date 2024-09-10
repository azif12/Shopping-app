import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/HomePage/Bottomnavigation/CartPage.dart';
import 'package:shopping_app/Screens/HomePage/Bottomnavigation/Feeds.dart';
import 'package:shopping_app/Screens/HomePage/home_screen.dart';
import 'package:shopping_app/Screens/SearchPage/SearchPage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final Function(int)? onChanged;

  const MyBottomNavigationBar({Key? key, this.onChanged}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    ReelsScreen(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(index);
          }
        },
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.play_circle),
            title: Text('Feeds'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text('Cart'),
          ),
        ],
      ),
    );
  }
}
