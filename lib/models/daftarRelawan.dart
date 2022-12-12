// To parse this JSON data, do
//
//     final pendaftaran = pendaftaranFromJson(jsonString);

import 'dart:convert';

List<Pendaftaran> pendaftaranFromJson(String str) => List<Pendaftaran>.from(json.decode(str).map((x) => Pendaftaran.fromJson(x)));

String pendaftaranToJson(List<Pendaftaran> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pendaftaran {
  Pendaftaran({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Pendaftaran.fromJson(Map<String, dynamic> json) => Pendaftaran(
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
    required this.wilayah,
    required this.relawan,
    required this.keahlian,
    required this.mulaiPeriode,
    required this.akhirPeriode,
  });

  int wilayah;
  int relawan;
  String keahlian;
  DateTime mulaiPeriode;
  DateTime akhirPeriode;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    wilayah: json["wilayah"],
    relawan: json["relawan"],
    keahlian: json["keahlian"],
    mulaiPeriode: DateTime.parse(json["mulai_periode"]),
    akhirPeriode: DateTime.parse(json["akhir_periode"]),
  );

  Map<String, dynamic> toJson() => {
    "wilayah": wilayah,
    "relawan": relawan,
    "keahlian": keahlian,
    "mulai_periode": mulaiPeriode.toIso8601String(),
    "akhir_periode": akhirPeriode.toIso8601String(),
  };
}
