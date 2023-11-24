// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:summer_project/Models/CategoriesModels.dart';
import 'package:summer_project/Screens/User/SingleCategory.dart';

class CateGoriesWidget extends StatelessWidget {
  const CateGoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categories').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("error"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No categories found"),
          );
        }
        if (snapshot.data != null) {
          return Container(
            height: Get.height / 4,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CategoriesModel categoriesModel = CategoriesModel(
                      categoryId: snapshot.data!.docs[index]['categoryId'],
                      categoryImg: snapshot.data!.docs[index]['categoryImg'],
                      categoryName: snapshot.data!.docs[index]['categoryName'],
                      createdAt: snapshot.data!.docs[index]['createdAt'],
                      updatedAt: snapshot.data!.docs[index]['updatedAt']);
                  return GestureDetector(
                    onTap: () => Get.to(() => AllSingleCategoryProductsScreen(
                        categoryId: categoriesModel.categoryId)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 4,
                              heightImage: Get.height / 12,
                              imageProvider: CachedNetworkImageProvider(
                                  categoriesModel.categoryImg),
                              title: Center(
                                  child: Text(
                                categoriesModel.categoryName,
                                style: TextStyle(fontSize: 12),
                              )),
                              footer: Text(''),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        }

        return Container();
      },
    );
  }
}
