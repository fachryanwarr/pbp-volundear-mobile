import 'package:volundear/models/artikel.dart';
import 'package:volundear/models/komentarArtikel.dart';
import 'package:flutter/material.dart';

class KomentarItemCard extends StatelessWidget {
  final Komentar komentar;
  final Artikel artikel;
  const KomentarItemCard({
    Key? key,
    required this.komentar,
    required this.artikel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artikel.pk == komentar.fields.artikel) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.lightBlue
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (komentar.fields.penulis).toString(),
                style: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${komentar.fields.waktu.year}-${komentar.fields.waktu.month}-${komentar.fields.waktu.day}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                komentar.fields.deskripsi,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ); 
    } else {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          'Belum ada komentar :(',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepPurple.shade200,
            fontSize: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}