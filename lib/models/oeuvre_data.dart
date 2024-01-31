import 'dart:convert';

import 'package:oeuvre/models/oeuvre.dart';
import 'package:http/http.dart' as http;

class OeuvreData {
  static Future<List<Oeuvres>> fetchOeuvres() async {
    final response = await http.get(
        Uri.parse('https://65b907e2b71048505a8a06c0.mockapi.io/api/prints'));

    if (response.statusCode == 200) {
      List<dynamic> oeuvresJson = jsonDecode(utf8.decode(response.bodyBytes));
      return oeuvresJson.map((json) => Oeuvres(
          int.parse(json['id'].toString()),
          json['title'],
          json['description'],
          json['image'],
          double.parse(json['price'].toString()),
          json['size'],
          json['collection'])
      ).toList();
    } else {
      throw Exception('Failed to load oeuvres');
    }
  }

  static Future<List<Oeuvres>> buildList() async {
    List<Oeuvres> list = await fetchOeuvres();
    // Traitez et retournez la liste ici si nécessaire
    return list;
  }
}
