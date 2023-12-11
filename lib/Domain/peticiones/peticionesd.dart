import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Gets {
  final String baseUrl = "https://api-amvstrm.nyt92.eu.org/api/v2";

  Future<Animes?> get getPopulares async {
    final response = await http.get(Uri.parse("$baseUrl/popular"));

    if (response.statusCode == 200) {
      print(response.body);
      return compute(animesFromJson, response.body);
    }
  }
}
