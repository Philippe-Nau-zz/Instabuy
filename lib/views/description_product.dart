import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/widgets/title_row.dart';

class DescriptionProduct extends StatelessWidget {
  final _arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          flexibleSpace: SafeArea(
              child: Center(
            child:
                TitleRow(title: 'Instabuy', icon: Icons.shopping_cart_outlined),
          )),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          child: Column(
            children: [
              Container(
                height: 250,
                child: Image(
                  image: CachedNetworkImageProvider(_arguments[0]),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _arguments[1],
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Divider(
                          indent: 0,
                          endIndent: 0,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          _arguments[2],
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
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
