import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  final String urlImage;
  final String currentPrice;
  final String description;
  final String price;
  final String title;

  const CardItems({
    @required this.urlImage,
    @required this.currentPrice,
    @required this.description,
    this.price,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => Get.toNamed('/description',
            arguments: [this.urlImage, this.title, this.description]),
        splashColor: Colors.orange.withOpacity(0.3),
        highlightColor: Colors.orange.withOpacity(0.2),
        child: Container(
          width: 220,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  child: Image(
                    image: CachedNetworkImageProvider(
                      this.urlImage,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.currentPrice,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(),
                    this.price != null
                        ? Text(
                            this.price,
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : SizedBox(),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    maxLines: 2,
                    style: Theme.of(context).primaryTextTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
