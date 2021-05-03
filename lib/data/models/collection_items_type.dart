import 'dart:convert';

import 'collection_items_prices_type.dart';

class CollectionItemsType {
  String id;
  String name;
  String unit_type;
  String description;
  List<String> images;
  List<CollectionItemsPricesType> prices;

  CollectionItemsType({
    this.id,
    this.name,
    this.unit_type,
    this.description,
    this.images,
    this.prices,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit_type': unit_type,
      'description': description,
      'images': images,
      'prices': prices?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CollectionItemsType.fromMap(Map<String, dynamic> map) {
    String formatText(String str) {
      str = str.replaceAll('<p>', '').trim();
      str = str.replaceAll('</p>', '\n').trim();
      str = str.replaceAll('<br>', '\n').trim();
      str = str.replaceAll('</strong>', '').trim();
      str = str
          .replaceAll('<strong style="color: rgb(114, 132, 154);">', '')
          .trim();
      return str;
    }

    return CollectionItemsType(
      id: map['id'],
      name: map['name'],
      unit_type: map['unit_type'],
      description: formatText(map['description']),
      images: List<String>.from(map['images']),
      prices: List<CollectionItemsPricesType>.from(
          map['prices']?.map((x) => CollectionItemsPricesType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionItemsType.fromJson(String source) =>
      CollectionItemsType.fromMap(json.decode(source));
}
