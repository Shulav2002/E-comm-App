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

import '../../Widgets/all-productWidgets.dart';
import '../../Widgets/sale-widget.dart';
import '../searchScreen.dart';
import 'all-products.dart';
import 'all-sale.dart';
import 'cart-panel.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 0, 0, 0),
            statusBarBrightness: Brightness.light),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

        // ignore: prefer_const_constructors
        title: Text(AppConstant.appMainName,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              Get.to(() => SearchScreen());
              // Handle search button press here
              // You can navigate to a search screen or show a search bar overlay
              // For simplicity, we'll print a message for demonstration purposes
            },
          ),
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              BannerWidget(),
              SizedBox(
                height: Get.height / 90,
              ),
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () {
                  Get.to(() => AllCategoriesScreen());
                },
                buttonText: "See More >",
              ),
              CateGoriesWidget(),
              SizedBox(
                height: Get.height / 90,
              ),
              HeadingWidget(
                headingTitle: "Sale",
                headingSubTitle: "According to your budget",
                onTap: () {
                  Get.to(() => AllSaleProducts());
                },
                buttonText: "See More >",
              ),
              saleWidget(),
              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),
              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
