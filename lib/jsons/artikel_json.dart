import 'package:volundear/models/artikel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtikelData {
  Future<List<Artikel>> fetchMyWatchList() async {
    try {
      Uri url = Uri.parse(
          'https://volundear.up.railway.app/artikel/json/');
      var response = await http.get(url);
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Artikel> artikelList = [];
      for (var item in data) {
        artikelList.add(Artikel.fromJson(item['fields']));
      }
      return artikelList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}