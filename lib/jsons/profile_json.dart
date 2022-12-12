import 'package:volundear/models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile {
  Future<List<Profile>> fetchProfile() async {
    try {
      Uri url = Uri.parse('https://volundear.up.railway.app/profile/json/');
      var response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      List<Profile> userDataList = [];
      for (var item in data) {
        if (item != null) {
          userDataList.add(Profile.fromJson(item));
        }
      }
      return userDataList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}
