import 'dart:convert';
import 'dart:io';

import 'package:pizza_api_avicenna/pizza.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'lv70e.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future <List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == 200 || result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas = jsonResponse.map<Pizza>((pizza) => Pizza.fromJson(pizza)).toList();
      return pizzas;
    } else {
      return <Pizza>[];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const String postPath = 'pizza';
    String post = jsonEncode(pizza.toJson());
    final Uri url = Uri.https(authority, postPath);
    final http.Response result = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: post,
    );
    return result.body;
  }
}