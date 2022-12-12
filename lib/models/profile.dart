import 'dart:convert';
import 'package:meta/meta.dart';

class Profile {
  Profile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final Fields fields;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.name,
    required this.gender,
    required this.phone_number,
    required this.pekerjaan,
    required this.alamat,
    required this.tanggal_lahir,
  });

  final user;
  final String name;
  final String gender;
  final int phone_number;
  final String pekerjaan;
  final String alamat;
  final int tanggal_lahir;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        gender: json["gender"],
        phone_number: json["phone_number"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        tanggal_lahir: json["tanggal_lahir"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "gender": gender,
        "phone_number": phone_number,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "tanggal_lahir": tanggal_lahir,
      };
}
