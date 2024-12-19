// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart' as slider;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_project/Controllers/banner-controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final slider.CarouselController _controller = slider.CarouselController();
  final bannerController _bannerController = Get.put(bannerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (_bannerController.bannerUrls.isEmpty) {
          return Center(
            child: Text("No banners available", style: TextStyle(fontSize: 16)),
          );
        }

        return CarouselSlider(
          items: _bannerController.bannerUrls
              .map(
                (imageUrl) => ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: Get.width,
                    placeholder: (context, url) => ColoredBox(
                      color: Colors.black,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: Colors.red),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 16 / 9, // Adjust to match the image aspect ratio
            viewportFraction: 1,
          ),
          carouselController: _controller,
        );
      }),
    );
  }
}
