import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsAndPrice extends StatelessWidget {
  const ProductsAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstance = Provider.of<Cart>(context);
    return  Row(
      children: [
        Stack(
          children: [
            Positioned(
                bottom: 24,
                child: Container(
                  child: Text(
                    "${classInstance.SelectedProduct.length}",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle),
                )),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut()));
              },
              icon: Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            "\$ ${classInstance.price.round()}",
            style: TextStyle(fontSize: 18),
          ),
        ),
        // ProductsAndPrice(),
      ],
    );
  }
}
