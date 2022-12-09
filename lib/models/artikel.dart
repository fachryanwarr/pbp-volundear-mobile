class Artikel {
    Artikel({
        required this.model,
        required this.pk,
        required this.fields,
    });

    final String model;
    final int pk;
    final Fields fields;

    factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
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
        required this.penulis,
        required this.judul,
        required this.rilis,
        required this.pembuka,
        required this.isi,
    });

    final int penulis;
    final String judul;
    final DateTime rilis;
    final String pembuka;
    final String isi;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        penulis: json["penulis"],
        judul: json["judul"],
        rilis: DateTime.parse(json["rilis"]),
        pembuka: json["pembuka"],
        isi: json["isi"],
    );

    Map<String, dynamic> toJson() => {
        "penulis": penulis,
        "judul": judul,
        "rilis": "${rilis.year.toString().padLeft(4, '0')}-${rilis.month.toString().padLeft(2, '0')}-${rilis.day.toString().padLeft(2, '0')}",
        "pembuka": pembuka,
        "isi": isi,
    };
}
