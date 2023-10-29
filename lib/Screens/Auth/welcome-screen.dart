// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:summer_project/Controllers/google-sign-in-controller.dart';
import 'package:summer_project/Screens/Auth/signin-screen.dart';
import 'package:summer_project/Utils/app-constants.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Welcome",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/ShoppingCart.json'),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Happy Shopping",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: Get.height / 24,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset('assets/images/google.png'),
                  label: Text("sign in with google",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 32,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Icon(Icons.email,
                      color: AppConstant.appTextColor, size: 50),
                  label: Text("sign in with email",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Get.to(() => signinScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
