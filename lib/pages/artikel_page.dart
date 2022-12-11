import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/models/artikel.dart';
import 'package:volundear/pages/artikel_detail.dart';
import 'package:volundear/widgets/artikel_item_card.dart';

class ArtikelPage extends StatefulWidget {
    const ArtikelPage({Key? key}) : super(key: key);

    @override
    State<ArtikelPage> createState() => _ArtikelPage();
}

class _ArtikelPage extends State<ArtikelPage> {
    late Future<List<Artikel>> _artikel;
    late ArtikelData _artikelData;
    
    @override
    void initState() {
      _artikelData = ArtikelData();
      _artikel = _artikelData.fetchArtikel();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        appBar: AppBar(
          title: const Text('Artikel'),
        ),
        // Menambahkan drawer menu
        drawer: const MyDrawer(),
        body: Center(
          child: FutureBuilder(
            future: _artikel,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Belum ada artikel :(',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 89, 0, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                } else {
                  return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArtikelDetail(
                                  artikel: snapshot.data![index],
                                ),
                              ),
                            ),
                            child: ArtikelItemCard(
                              artikel: snapshot.data![index],
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 12),
                      );
                }
              }
            },
          ),
        )
      );
  }
}