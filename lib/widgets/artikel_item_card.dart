import 'package:flutter/material.dart';
import 'package:volundear/models/artikel.dart';

class ArtikelItemCard extends StatelessWidget {
  final Artikel artikel;
  const ArtikelItemCard({
    Key? key,
    required this.artikel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.lightBlue
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              artikel.fields.judul,
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              artikel.fields.pembuka,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
      ),
    );
  }
}