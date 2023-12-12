import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Gets {
  final String baseUrl = "https://api-amvstrm.nyt92.eu.org/api/v2";

  Future<Animes> getPopulares() async {
    final response = await http.get(Uri.parse("$baseUrl/popular"));

    if (response.statusCode == 200) {
      return compute(animesFromJson, response.body);
    } else {
      // Manejar el error lanzando una excepción
      throw Exception(
          "Error al obtener animes populares. Código de estado: ${response.statusCode}");
    }
  }
}
