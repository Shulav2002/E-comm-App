import 'package:flutter/material.dart';
import 'package:summer_project/Utils/app-constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(AppConstant.appMainName),
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor),
    );
  }
}
