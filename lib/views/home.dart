import 'package:flutter/material.dart';
import 'package:instabuy_testinho/widgets/banner_carousel.dart';
import 'package:instabuy_testinho/widgets/listview_collection_items.dart';
import 'package:instabuy_testinho/widgets/listview_promo.dart';
import 'package:instabuy_testinho/widgets/title_row.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TitleRow(
                    title: 'Instabuy', icon: Icons.shopping_cart_outlined),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.only(top: 20, right: 10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BannerCarousel(),
                    Container(
                      height: 340,
                      child: ListviewPromo(),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (ctx, index) => ListviewCollectionItems(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
