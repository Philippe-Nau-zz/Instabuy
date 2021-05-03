import 'dart:convert';

class PricesType {
  double price;
  double promo_price;

  PricesType({
    this.price,
    this.promo_price,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'promo_price': promo_price,
    };
  }

  factory PricesType.fromMap(Map<String, dynamic> map) {
    return PricesType(
      price: map['price'],
      promo_price: map['promo_price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PricesType.fromJson(String source) =>
      PricesType.fromMap(json.decode(source));
}
