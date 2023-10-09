import 'package:ecommerce_int2/models/image.dart';
import 'package:ecommerce_int2/models/product_options.dart';
import 'package:ecommerce_int2/models/product_variant.dart';

class Product{
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.variants,
    required this.options,
    required this.images,
  });

  String id;
  String title;
  String description;
  String thumbnail;

  List<Variant> variants;
  List<Option> options;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    variants: List<Variant>.from(
        json["variants"].map((x) => Variant.fromJson(x))),
    options:
    List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );
}