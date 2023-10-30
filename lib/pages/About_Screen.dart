import 'package:flutter/material.dart';

import '../shared/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("About"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("This Our E-Commerce \nApplication Enjoy it",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(child: Text("Contact US",style: TextStyle(fontWeight: FontWeight.w500)),padding: EdgeInsets.only(top: 10.0)),
            Container(child: Text("Anwar Tel : +967 775309993 ",style: TextStyle(fontWeight: FontWeight.w600)),padding: EdgeInsets.only(top: 10.0)),
            Container(child: Text("Hatem Tel : +967 776771034 ",style: TextStyle(fontWeight: FontWeight.w600)),padding: EdgeInsets.only(top: 10.0)),
          ],
        ),
      ),
    );
  }
}
