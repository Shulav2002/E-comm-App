// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summer_project/Screens/Auth/welcome-screen.dart';
import 'package:summer_project/Screens/User/all-categories.dart';
import 'package:summer_project/Utils/app-constants.dart';
import 'package:summer_project/Widgets/Categories.dart';
import 'package:summer_project/Widgets/Custom-drawer.dart';
import 'package:summer_project/Widgets/banner-widget.dart';
import 'package:summer_project/Widgets/heading-widget.dart';

import '../../Widgets/sale-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstant.appSecondaryColor,
            statusBarBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,

        // ignore: prefer_const_constructors
        title: Text(AppConstant.appMainName,
            style: TextStyle(color: AppConstant.appTextColor)),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90,
              ),
              BannerWidget(),
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () {
                  Get.to(() => AllCategoriesScreen());
                },
                buttonText: "See More >",
              ),
              CateGoriesWidget(),
              HeadingWidget(
                headingTitle: "Latest",
                headingSubTitle: "According to your budget",
                onTap: () {},
                buttonText: "See More >",
              ),
              saleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
