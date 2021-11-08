import 'package:ecommerce/adminScreens/addProduct.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/utils/custom_colors.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/login.dart';
import 'package:ecommerce/splashpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //attributes in theme data would apply in entire app
      theme: ThemeData(primaryColor: primaryColor),
      home: SplashInitPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        LoginPage.id: (context) => LoginPage(),
        ProfileInitPage.id: (context) => ProfileInitPage(),
        MainScreenPage.id: (context) => MainScreenPage(),
        AddProductPage.id: (context) => AddProductPage()
      },
    );
  }
}
