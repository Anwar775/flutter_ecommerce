import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
    List SelectedProduct = [];
    double price = 0;

    add(product)
    {
        SelectedProduct.add(product);
        price += product.price.round();
        notifyListeners();
    //     to reload widgets
    }
    delete(product)
    {
        SelectedProduct.remove(product);
        price -= product.price.round();
        notifyListeners();

        // rebuild method
    }
}