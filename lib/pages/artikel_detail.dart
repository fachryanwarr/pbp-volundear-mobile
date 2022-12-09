import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/models/artikel.dart';
import 'package:volundear/pages/artikel_form_page.dart';
import 'package:volundear/pages/artikel_page.dart';

class ArtikelDetail extends StatefulWidget {
  final Artikel artikel;
  const ArtikelDetail({
    Key? key,
    required this.artikel,
  }) : super(key: key);

  @override
  State<ArtikelDetail> createState() => _ArtikelDetailState();
}

class _ArtikelDetailState extends State<ArtikelDetail>{
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Artikel Lengkap'),
          elevation: 0,
        ),
        // Menambahkan drawer menu
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.artikel.fields.judul,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        (widget.artikel.fields.penulis).toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${widget.artikel.fields.rilis.year}-${widget.artikel.fields.rilis.month}-${widget.artikel.fields.rilis.day}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget.artikel.fields.pembuka,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget.artikel.fields.isi,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                // Button komentar
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ArtikelPage()), //FormKomentar()
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text('Komentar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ArtikelForm()), //FormKomentar()
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text('Tambah Artikel'),
                  ),
                ),
                // Button kembali
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        )
        
      );
}