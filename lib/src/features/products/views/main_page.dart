import 'package:flutter/material.dart';

import '../../cart/cart_page.dart';
import '../../profile/profile_page.dart';
import '../../search/search_page.dart';

import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;
  List screens = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedTab],
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 38,
                width: 38,
                child: IconButton(
                  onPressed: () {
                    _handleIndexChanged(0);
                  },
                  icon: Icon(
                    Icons.home,
                    color: _selectedTab == 0 ? Colors.white : Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 38,
                width: 38,
                child: IconButton(
                  onPressed: () {
                    _handleIndexChanged(1);
                  },
                  icon: Icon(
                    Icons.search,
                    color: _selectedTab == 1 ? Colors.white : Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 38,
                width: 38,
                child: IconButton(
                  onPressed: () {
                    _handleIndexChanged(2);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _selectedTab == 2 ? Colors.white : Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 38,
                width: 38,
                child: IconButton(
                  onPressed: () {
                    _handleIndexChanged(3);
                  },
                  icon: Icon(
                    Icons.person,
                    color: _selectedTab == 3 ? Colors.white : Colors.grey,
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
