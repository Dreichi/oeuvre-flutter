import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Oeuvres>> fetchOeuvres() async {
  final response = await http.get(Uri.parse('https://65b907e2b71048505a8a06c0.mockapi.io/api/prints'));

  if (response.statusCode == 200) {
    List<dynamic> oeuvresJson = jsonDecode(utf8.decode(response.bodyBytes));
    return oeuvresJson.map((json) => Oeuvres(
        int.parse(json['id']),
        json['title'],
        json['description'],
        json['image'],
        json['price'],
        json['size'],
        json['collection'])
    ).toList();
  } else {
    throw Exception('Failed to load oeuvres');
  }
}

class Oeuvres {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String size;
  final String collection;

  Oeuvres(this.id, this.title, this.description, this.image, this.price, this.size, this.collection);
}
