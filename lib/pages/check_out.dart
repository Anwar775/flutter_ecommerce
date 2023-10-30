
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/shared/appbar.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final classInstance = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("CheckOut Screen"),
        // actions: [ProductsAndPrice()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: classInstance.SelectedProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(classInstance.SelectedProduct[index].name),
                      subtitle: Text(
                          "\$ ${classInstance.SelectedProduct[index].price} - ${classInstance.SelectedProduct[index].Location}"),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            classInstance.SelectedProduct[index].Path),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          classInstance.delete(classInstance.SelectedProduct[index]);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            //   press button for pay
              AlertDialog(
                title: Text("Success"),
                content: Text("Saved successfully"),
              );
            },
            child: Text(
              "Pay ${classInstance.price}",
              style: TextStyle(fontSize: 19.0),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnPink),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
