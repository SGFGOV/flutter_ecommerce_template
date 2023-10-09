import 'dart:convert';
import 'dart:html';
import 'package:ecommerce_int2/api/api_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_int2/models/product.dart';

class StorefrontApi extends ApiService{
  var getAllProducts = <Product>[].obs;
  var isLoading = true.obs;

  String urlWithLimits () {
    return ApiService.apiUrl+"/store";
  }

  void fetchAllProduct() async {
    isLoading(true);
    try {
      var getAllProductResult = await this.getAllProducts();
      getAllProducts.value = getAllProductResult;
    } finally {
      isLoading(false);
    }
  }
  Future<List<Product>> getProducts({limit=20,skip=0}) async {

    final urlString = this.urlWithLimits()+"/products?"+"limit="+limit+"&skip="+skip;
    final url = Uri.parse(urlString);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var data = result['products'];

        return List<Product>.from(data.map((x) => Product.fromJson(x)));
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
    throw 'error';
  }

  @override
  String url() {
    return this.urlWithLimits();

  }
}
