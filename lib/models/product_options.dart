import 'package:ecommerce_int2/models/value.dart';

class Option {
  Option({
    required this.title,
    required this.values,
  });

  String title;

  List<Value> values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        title: json["title"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );
}

