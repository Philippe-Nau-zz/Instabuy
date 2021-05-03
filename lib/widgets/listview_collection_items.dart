import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/controllers/main_controller.dart';
import 'package:instabuy_testinho/data/models/collection_items_model.dart';
import 'package:instabuy_testinho/widgets/card_items.dart';

class ListviewCollectionItems extends GetView<MainController> {
  final String _baseUrlPromo =
      'https://assets.instabuy.com.br/ib.item.image.small/s-';

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<CollectionItemsModel> _items =
          controller.findCollectionItems();
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: _items.length,
        itemBuilder: (context, index0) => Container(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  _items[index0].title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items[index0].items.length,
                    itemBuilder: (context, index1) {
                      return CardItems(
                          urlImage:
                              '${_baseUrlPromo + _items[index0].items[index1].images[0]}',
                          currentPrice:
                              'R\$ ${_items[index0].items[index1].prices[0].price.toStringAsFixed(2)}',
                          title: _items[index0].items[index1].name,
                          description:
                              _items[index0].items[index1].description);
                    }),
              ),
              Divider(
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      );
    });
  }
}
