class Donasi {
    Donasi({
        required this.model,
        required this.pk,
        required this.fields,
    });

    final String model;
    final int pk;
    final Fields fields;

    factory Donasi.fromJson(Map<String, dynamic> json) => Donasi(
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
        required this.nama,
        required this.jumlah,
        required this.pesan,
    });

    final int user;
    final String nama;
    final int jumlah;
    final String pesan;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nama: json["nama"],
        jumlah: json["jumlah"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "jumlah": jumlah,
        "pesan": pesan,
    };
}
