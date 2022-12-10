import 'dart:convert';

List<Wilayah> wilayahFromJson(String str) => List<Wilayah>.from(json.decode(str).map((x) => Wilayah.fromJson(x)));

String wilayahToJson(List<Wilayah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wilayah {
  Wilayah({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Wilayah.fromJson(Map<String, dynamic> json) => Wilayah(
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
    required this.pj,
    required this.name,
    required this.kota,
    required this.kebutuhan,
    required this.address,
    required this.kuotaMax,
    required this.kuotaTerisi,
    required this.description,
    required this.awalPeriode,
    required this.akhirPeriode,
  });

  int pj;
  String name;
  String kota;
  String kebutuhan;
  String address;
  int kuotaMax;
  int kuotaTerisi;
  String description;
  DateTime awalPeriode;
  DateTime akhirPeriode;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    pj: json["pj"],
    name: json["name"],
    kota: json["kota"],
    kebutuhan: json["kebutuhan"],
    address: json["address"],
    kuotaMax: json["kuota_max"],
    kuotaTerisi: json["kuota_terisi"],
    description: json["description"],
    awalPeriode: DateTime.parse(json["awalPeriode"]),
    akhirPeriode: DateTime.parse(json["akhirPeriode"]),
  );

  Map<String, dynamic> toJson() => {
    "pj": pj,
    "name": name,
    "kota": kota,
    "kebutuhan": kebutuhan,
    "address": address,
    "kuota_max": kuotaMax,
    "kuota_terisi": kuotaTerisi,
    "description": description,
    "awalPeriode": "${awalPeriode.year.toString().padLeft(4, '0')}-${awalPeriode.month.toString().padLeft(2, '0')}-${awalPeriode.day.toString().padLeft(2, '0')}",
    "akhirPeriode": "${akhirPeriode.year.toString().padLeft(4, '0')}-${akhirPeriode.month.toString().padLeft(2, '0')}-${akhirPeriode.day.toString().padLeft(2, '0')}",
  };
}
