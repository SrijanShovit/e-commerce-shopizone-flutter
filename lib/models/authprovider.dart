import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authprovider {
  Future<bool> loginwithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          //to manage cannot asign <Future>User Credential to USer Credential use async await

          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = result.user;
          if (user != null) {
            Navigator.pushReplacementNamed(context, MainScreenPage.id);
          } else {
            Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int token) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Enter OTP'),
                  content: Column(
                    children: [
                      TextField(
                        controller: otpC,
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otpC.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, MainScreenPage.id);
                            print('successfully  signed in');
                          } else {
                            Fluttertoast.showToast(msg: 'error signing in');
                          }
                        },
                        child: Text('Verify'))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}
