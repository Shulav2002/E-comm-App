// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Utils/app-constants.dart';

// ignore: use_key_in_widget_constructors
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('search'),
      ),
      // ignore: prefer_const_constructors
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SearchBar(),
          Expanded(
            child: Center(
              child: Text('Search results will be displayed here!'),
            ),
          ),
        ],
      ),
    );
  }
}
