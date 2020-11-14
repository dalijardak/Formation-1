import "package:flutter/material.dart";
import 'package:shop/model/product.dart';

class ProductView extends StatefulWidget {
  final Product product;
  ProductView({
    this.product,
  });
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            enableFeedback: true,
            onDoubleTap: () {
              setState(() {
                isFav = !isFav;
              });
            },
            child: Container(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: isFav
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        ),
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                ),
              ),
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    this.widget.product.imgUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 7, bottom: 5),
          child: Text(
            this.widget.product.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(
          "\$${this.widget.product.price} ",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
