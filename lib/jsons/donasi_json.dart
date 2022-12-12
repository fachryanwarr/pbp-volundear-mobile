import 'package:volundear/models/donasi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonasiData{
  Future<List<Donasi>> fetchDonasi() async {
    try {
      Uri url = Uri.parse(
          'https://volundear.up.railway.app/donasi/json/');
      var response = await http.get(
          url,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
        );
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      
      List<Donasi> donasiList = [];
      for (var item in data) {
        if (item != null){
          donasiList.add(Donasi.fromJson(item));
        }
        
      }
      return donasiList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}