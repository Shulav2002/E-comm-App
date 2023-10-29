// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summer_project/Screens/Auth/welcome-screen.dart';
import 'package:summer_project/Utils/app-constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarBrightness: Brightness.light),
      backgroundColor: AppConstant.appMainColor,

      // ignore: prefer_const_constructors
      title: Text(AppConstant.appMainName),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () async {
            GoogleSignIn googleSignIn = GoogleSignIn();
            FirebaseAuth _auth = FirebaseAuth.instance;
            await _auth.signOut();
            await googleSignIn.signOut();
            Get.offAll(() => WelcomeScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.logout),
          ),
        )
      ],
    ));
  }
}
