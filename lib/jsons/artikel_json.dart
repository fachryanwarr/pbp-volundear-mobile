import 'package:volundear/models/artikel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:volundear/models/artikelKomentar.dart';

class ArtikelData {
  Future<List<Artikel>> fetchArtikel({String? query}) async {
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
      
      if (query != null) {
        artikelList = artikelList.where((element) => element.fields.judul.toLowerCase().contains(query.toLowerCase())).toList();
      }

      }
      return artikelList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

class KomentarData{
  Future<List<Komentar>> fetchKomentar() async {
    try {
      Uri url = Uri.parse(
          'https://volundear.up.railway.app/artikel/comments-json/');
      var response = await http.get(
          url,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
        );
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      
      List<Komentar> komentarList = [];
      for (var item in data) {
        if (item != null){
          komentarList.add(Komentar.fromJson(item));
        }
        
      }
      return komentarList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}