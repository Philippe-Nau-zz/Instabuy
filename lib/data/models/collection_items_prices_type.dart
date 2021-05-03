import 'dart:convert';

class CollectionItemsPricesType {
  double price;

  CollectionItemsPricesType({
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
    };
  }

  factory CollectionItemsPricesType.fromMap(Map<String, dynamic> map) {
    return CollectionItemsPricesType(
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionItemsPricesType.fromJson(String source) =>
      CollectionItemsPricesType.fromMap(json.decode(source));
}
