import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/controllers/main_controller.dart';
import 'package:instabuy_testinho/data/models/promo_model.dart';
import 'package:instabuy_testinho/widgets/card_items.dart';

class ListviewPromo extends GetView<MainController> {
  final String _baseUrlPromo =
      'https://assets.instabuy.com.br/ib.item.image.small/s-';
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<PromoModel> _items = controller.findPromos();
      return Column(
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
              'Ofertas',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return CardItems(
                    urlImage: '${_baseUrlPromo + _items[index].images[0]}',
                    currentPrice:
                        'R\$ ${_items[index].prices[0].promo_price.toStringAsFixed(2)}',
                    price:
                        'R\$ ${_items[index].prices[0].price.toStringAsFixed(2)}',
                    title: _items[index].name,
                    description: _items[index].description,
                  );
                }),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    });
  }
}
