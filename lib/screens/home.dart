import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/view/productListView.dart';
import 'package:shop/view/productView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void onSelect(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> _screens = [
    SafeArea(
      child: Center(
        child: ProductListView(
          productListView: [
            for (var i = 0; i < 7; i++)
              ProductView(
                product: Product(
                  id: 1,
                  name: "Korsi",
                  description: "Korsi mezyen",
                  price: "19.00",
                  imgUrl: "https://hmp.me/dgq0",
                ),
              ),
          ],
        ),
      ),
    ),
    Center(
      child: Text("Dashboard"),
    ),
    Center(
      child: Text("Login"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Shop",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Login",
          ),
        ],
        currentIndex: currentIndex,
        onTap: onSelect,
      ),
    );
  }
}
