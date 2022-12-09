import 'package:volundear/models/artikel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtikelData {
  Future<List<Artikel>> fetchArtikel() async {
    try {
      Uri url = Uri.parse(
          'https://volundear.up.railway.app/artikel/json/');
      var response = await http.get(
          url,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
        );
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      
      List<Artikel> artikelList = [];
      for (var item in data) {
        if (item != null){
          artikelList.add(Artikel.fromJson(item));
        }
        
      }
      return artikelList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}