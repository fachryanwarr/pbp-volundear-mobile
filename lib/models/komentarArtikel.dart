class Komentar {
    Komentar({
        required this.model,
        required this.pk,
        required this.fields,
    });

    final String model;
    final int pk;
    final Fields fields;

    factory Komentar.fromJson(Map<String, dynamic> json) => Komentar(
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
        required this.artikel,
        required this.penulis,
        required this.waktu,
        required this.deskripsi,
    });

    final int artikel;
    final int penulis;
    final DateTime waktu;
    final String deskripsi;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        artikel: json["artikel"],
        penulis: json["penulis"],
        waktu: DateTime.parse(json["waktu"]),
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "artikel": artikel,
        "penulis": penulis,
        "waktu": "${waktu.year.toString().padLeft(4, '0')}-${waktu.month.toString().padLeft(2, '0')}-${waktu.day.toString().padLeft(2, '0')}",
        "deskripsi": deskripsi,
    };
}
