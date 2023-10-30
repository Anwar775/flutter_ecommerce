import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/pages/About_Screen.dart';
import 'package:e_commerce/pages/SplashScreen.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth/login.dart';


// async
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {return Cart();  },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash_Screen(), //Splash_Screen(),
        routes: {
          "Signup": (context) => SignUp(),
          "login": (context) => LoginPage(),
          "home": (context) => Home(),
        },
      ),
    );
  }
}