import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

abstract class ApiService {
  static String urlWithLimits(int nrResults) {
    return apiUrl;
  }
  static String apiUrl = "https://alpha.sourcegoodfood.com";

  String url();

  static Future<List<User>> getUsers({int nrUsers = 1}) async {
    try {
      final response = await http.get(
          //TODO flutter 2 migration
          Uri(
            path: urlWithLimits(nrUsers),
          ),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        Iterable list = data["results"];
        List<User> users = list.map((l) => User.fromJson(l)).toList();
        return users;
      } else {
        print(response.body);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
