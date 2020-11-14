import 'package:flutter/material.dart';
import 'package:shop/view/productView.dart';

class ProductListView extends StatelessWidget {
  final List<ProductView> productListView;
  ProductListView({this.productListView});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        children: productListView,
      ),
    );
  }
}
