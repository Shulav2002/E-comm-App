// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, avoid_unnecessary_containers, body_might_complete_normally_nullable, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:summer_project/Models/CategoriesModels.dart';
import 'package:summer_project/Models/productModel.dart';

class saleWidget extends StatelessWidget {
  const saleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: true)
          .get(),
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
            child: Text("No prod found"),
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
                  final prodData = snapshot.data!.docs[index];
                  ProductModel productModel = ProductModel(
                      productId: prodData['productId'],
                      categoryId: prodData['categoryId'],
                      productName: prodData['productName'],
                      categoryName: prodData['categoryName'],
                      salePrice: prodData['salePrice'],
                      fullPrice: prodData['fullPrice'],
                      productImages: prodData['productImages'],
                      deliveryTime: prodData['deliveryTime'],
                      isSale: prodData['isSale'],
                      productDescription: prodData['productDescription'],
                      createdAt: prodData['createdAt'],
                      updatedAt: prodData['updatedAt']);

                  // CategoriesModel categoriesModel = CategoriesModel(
                  //     categoryId: snapshot.data!.docs[index]['categoryId'],
                  //     categoryImg: snapshot.data!.docs[index]['categoryImg'],
                  //     categoryName: snapshot.data!.docs[index]['categoryName'],
                  //     createdAt: snapshot.data!.docs[index]['createdAt'],
                  //     updatedAt: snapshot.data!.docs[index]['updatedAt']);
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          child: FillImageCard(
                            borderRadius: 20.0,
                            width: Get.width / 4,
                            heightImage: Get.height / 12,
                            imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0]),
                            title: Center(
                                child: Text(
                              productModel.productName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            )),
                            footer: Text(''),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        }

        return Container();
      },
    );
  }
}
