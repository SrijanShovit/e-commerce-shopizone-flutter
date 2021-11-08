import 'package:ecommerce/models/authprovider.dart';
import 'package:ecommerce/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const id = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey formkey = GlobalKey<FormState>();

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.jpg', height: 300),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: inputController,
                          decoration: InputDecoration(
                            hintText: 'enter phone number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      //to let button occupy entire width
                      minWidth: double.infinity,
                      color: primaryColor,
                      onPressed: () {
                        if (inputController.text != null) {
                          final phone = '+91' + inputController.text;
                          Authprovider().loginwithPhone(context, phone);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
