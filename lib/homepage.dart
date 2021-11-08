import 'package:ecommerce/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'utils/custom_colors.dart';

class ProfileInitPage extends StatelessWidget {
  static const id = '/HomePage';

//BuildContext context is given as argument to handle context in Navigator
  Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
        () => Navigator.pushReplacementNamed(context, LoginPage.id));
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController houseC = TextEditingController();
  TextEditingController streetC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController stateC = TextEditingController();
  TextEditingController countryC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text('Home pg'),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  signOut(context);
                })
          ],
        ),
        body: Center(
            child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Card(
              child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: nameC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter name',
                                  labelText: 'What people call you?',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: emailC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter email',
                                  labelText: 'What is your email?',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: houseC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter house no.',
                                  labelText: 'What is your house no.',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: streetC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter street',
                                  labelText: 'Enter street',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: cityC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter city',
                                  labelText: 'Enter city',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: stateC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter state',
                                  labelText:
                                      'Enter state/province/county/division',
                                  border: OutlineInputBorder())),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                              controller: countryC,
                              validator: (v) {
                                if (v.length < 5) {
                                  return 'Name length should be greater than 5';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter country',
                                  labelText: 'Enter country',
                                  border: OutlineInputBorder())),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.navigate_next),
            ),
          )
        ])));
  }
}
