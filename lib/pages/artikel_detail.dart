import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/models/artikel.dart';
import 'package:volundear/models/komentarArtikel.dart';
import 'package:volundear/pages/artikel_form_page.dart';
import 'package:volundear/pages/artikel_page.dart';
import 'package:volundear/widgets/komentar_artikel_item_card.dart';

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
  late Future<List<Komentar>> _komentar;
  late KomentarData _komentarData;
    
  @override
  void initState() {
    _komentarData = KomentarData();
    _komentar = _komentarData.fetchKomentar();
    super.initState();
  }
  
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
          child: Column(
            children: [
              Padding(
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "${widget.artikel.fields.rilis.year}-${widget.artikel.fields.rilis.month}-${widget.artikel.fields.rilis.day}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.artikel.fields.pembuka,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            widget.artikel.fields.isi,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //Komentar
              SizedBox(
                child: FutureBuilder(
                    future: _komentar,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Belum ada komentar :(',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.deepPurple.shade200,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  'Kolom komentar',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 0), 
                                  child: KomentarItemCard(
                                      komentar: snapshot.data![index],
                                      artikel: widget.artikel,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    },
                  ),
              ),
                // Button komentar
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
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
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
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
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    child: const Text('Back'),
                  ),
                ),
            ],
          ),
        )
        
      );
}