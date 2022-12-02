class Artikel {
    late String penulis;
    late String judul;
    late String rilis;
    late String pembuka;
    late String isi;

    Artikel({
        required this.penulis,
        required this.judul,
        required this.rilis,
        required this.pembuka,
        required this.isi,
    }); 

    Artikel.fromJson(Map<String, dynamic> json) {
      penulis = json['penulis'].toString();
      judul = json['judul'];
      rilis = json['rilis'];
      pembuka = json['pembuka'];
      isi = json['isi'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['penulis'] = penulis;
      data['judul'] = judul;
      data['rilis'] = rilis;
      data['pembuka'] = pembuka;
      data['isi'] = isi;
      return data;
    }
}