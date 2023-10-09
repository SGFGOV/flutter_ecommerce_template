import 'package:ecommerce_int2/models/value.dart';

class Variant {
  Variant({
    required this.id,
    required this.title,
    required this.prices,
    required this.options,
  });

  String id;
  String title;

  List<Price> prices;
  List<Value> options;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    title: json["title"]!,
    prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    options:
    List<Value>.from(json["options"].map((x) => Value.fromJson(x))),
  );
}

class Price {
  Price({
    required this.id,
    required this.currencyCode,
    required this.amount,
  });

  String id;
  String currencyCode;
  int amount;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    currencyCode: json["currency_code"]!,
    amount: json["amount"],
  );
}
