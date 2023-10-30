import 'package:e_commerce/auth/login.dart';
import 'package:e_commerce/model/item.dart';
import 'package:e_commerce/pages/About_Screen.dart';
import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/pages/details_screen.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/shared/appbar.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Make this class in other folder
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 22),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Details(product: items[index], price: items[index]),
                  ),
                );
              },
              child: GridTile(
                child: Stack(
                  children: [
                    Positioned(
                      // top: -3,
                      // bottom: -9,
                      // height: 0,
                      // left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset("${items[index].Path}"),
                      ),
                    ),
                  ],
                ),
                footer: GridTileBar(
                  trailing: Consumer<Cart>(
                    builder: (context, classInstance, child) {
                      return IconButton(
                          color: Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            classInstance.add(items[index]);
                          },
                          icon: Icon(Icons.add));
                    },
                  ),
                  leading: Text("${items[index].price}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  title: Text(""),
                ),
              ),
            );
          },
        ),
      ),
      // backgroundColor: appbarGreen,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  // DrawerHeaderImage
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.jpg"),
                        fit: BoxFit.cover),
                  ),
                  accountName: Text(
                    "Anwar Khaled Ali",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  accountEmail: Text("anweralsanabni@gmail.com"),
                  currentAccountPictureSize: Size.square(99),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    // profile
                    backgroundImage: AssetImage("images/background.jpg"),
                  ),
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
                ListTile(
                  title: Text("My Product"),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOut()),
                    );
                  },
                ),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {
                  //   About Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                  //   Logout
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
            Text(
              "Developed By Anwar Khaled © 2023",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Consumer<Cart>(
          builder: (context, classInstance, child) {
            // ${classInstance.SelectedProduct}
            return Text("Home");
          },
        ),
        backgroundColor: appbarGreen,
        actions: [
          Consumer<Cart>(builder: (context, classInstance, child) {
          //   Row() was Here
           return ProductsAndPrice();
          },),
        ],
      ),
    );
  }
}
