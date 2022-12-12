import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/models/artikel.dart';
import 'package:volundear/models/artikelKomentar.dart';
import 'package:volundear/pages/artikel_form_page.dart';
import 'package:volundear/pages/artikel_komentar_form.dart';
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
        backgroundColor: const Color(0xFF1E1E1E),
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
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
                              color: Color(0xFFe971d7),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            (widget.artikel.fields.penulis).toString(),
                            style: const TextStyle(
                              color: Colors.white,
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
                              color: Color(0xFFe971d7),
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
                              color: Color(0xFF4EC1F3),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.artikel.fields.isi,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Kolom komentar',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF4EC1F3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
                          return const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Belum ada komentar :(',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4EC1F3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                      MaterialPageRoute(builder: (context) => const KomentarForm()), //FormKomentar()
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50), 
                        backgroundColor: const Color(0xFFe971d7),
                    ),
                        
                    child: const Text('Komentar'),
                  ),
                ),
                // Button tambah artikel
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ArtikelForm()),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xFFe971d7),
                    ),
                    child: const Text('Tambah Artikel'),
                  ),
                ),
                // Button kembali
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xFFe971d7),
                    ),
                    child: const Text('Back'),
                  ),
                ),
            ],
          ),
        )
        
      );
}