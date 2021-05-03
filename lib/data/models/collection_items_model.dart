import 'dart:convert';

import 'package:instabuy_testinho/data/models/collection_items_type.dart';

class CollectionItemsModel {
  String title;
  List<CollectionItemsType> items;

  CollectionItemsModel({
    this.title,
    this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'items': items?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CollectionItemsModel.fromMap(Map<String, dynamic> map) {
    return CollectionItemsModel(
      title: map['title'],
      items: List<CollectionItemsType>.from(
          map['items']?.map((x) => CollectionItemsType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionItemsModel.fromJson(String source) =>
      CollectionItemsModel.fromMap(json.decode(source));
}
