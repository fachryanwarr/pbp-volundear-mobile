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
        required this.phoneNumber,
        required this.pekerjaan,
        required this.alamat,
        required this.tanggalLahir,
    });

    final int user;
    final String name;
    final String gender;
    final String phoneNumber;
    final String pekerjaan;
    final String alamat;
    final DateTime tanggalLahir;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "gender": gender,
        "phone_number": phoneNumber,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
    };
}
