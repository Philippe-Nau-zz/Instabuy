import 'dart:convert';

import 'package:instabuy_testinho/data/models/prices_type.dart';

class PromoModel {
  String id;
  String name;
  String unit_type;
  String description;
  List<PricesType> prices;
  List<String> images;

  PromoModel({
    this.id,
    this.name,
    this.unit_type,
    this.description,
    this.prices,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit_type': unit_type,
      'description': description,
      'prices': prices?.map((x) => x.toMap())?.toList(),
      'images': images,
    };
  }

  factory PromoModel.fromMap(Map<String, dynamic> map) {
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

    return PromoModel(
      id: map['id'],
      name: map['name'],
      unit_type: map['unit_type'],
      description: formatText(map['description']),
      prices: List<PricesType>.from(
          map['prices']?.map((x) => PricesType.fromMap(x))),
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PromoModel.fromJson(String source) =>
      PromoModel.fromMap(json.decode(source));
}
