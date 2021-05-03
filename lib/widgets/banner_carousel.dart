import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/controllers/main_controller.dart';
import 'package:instabuy_testinho/data/models/banner_model.dart';

class BannerCarousel extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<BannerModel> _items = controller.findBanners();
      return Container(
        height: 150,
        margin: EdgeInsets.only(bottom: 10),
        child: Carousel(
          autoplayDuration: Duration(seconds: 5),
          animationDuration: Duration(seconds: 3),
          showIndicator: false,
          images: _items
              .map((e) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: CachedNetworkImageProvider(e.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
    });
  }
}
