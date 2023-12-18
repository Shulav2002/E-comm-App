// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, duplicate_ignore, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:summer_project/Controllers/get-user-data-controller.dart';
import 'package:summer_project/Screens/Admin/Admin-main-screen.dart';
import 'package:summer_project/Screens/Auth/welcome-screen.dart';
import 'package:summer_project/Screens/User/main-screen.dart';
import 'package:summer_project/Utils/app-constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      loggedIn(context);
    });
  }

  Future<void> loggedIn(BuildContext context) async {
    //everyTime log in garda state preserve garna khojeko ho if paila admin thyo vane admin hunxa else user hunxa or vice versa
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());

      var userData = await getUserDataController.getUserData(user!.uid);
      if (userData[0]['isAdmin'] == true) {
        Get.off(() => AdminMainScreen());
      } else {
        Get.off(() => MainScreen());
      }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        elevation: 0,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Lottie.asset('assets/images/ShoppingCart.json'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            width: Get.width,
            alignment: Alignment.center,
            child: Text(
              AppConstant.appPoweredBy,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
