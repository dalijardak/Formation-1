import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/view/productListView.dart';
import 'package:shop/view/productView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int currentIndex = 0;
  void onSelect(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
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
      child: Text("Bag"),
    ),
    Center(
      child: Login(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Bag",
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
