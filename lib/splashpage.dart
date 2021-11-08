import 'dart:async';

import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/utils/custom_colors.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashInitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          //if connection is in waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          //if data is not present
          if (!snapshot.hasData || snapshot.data == null) {
            return LoginPage();
          } else if (snapshot.data.phoneNumber != null) {}
          return SplashPage();
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  static const id = '/SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override

  //always dispose timer after using it
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      //if we have data then by default we go to Home Page
      Navigator.pushReplacementNamed(context, MainScreenPage.id);
    });
  }

  //when one screen is going to other screen things that must be disposed are done here
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset('images/logo.jpg'),
          )),
          Text('Shoppizone'),
          Expanded(child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
