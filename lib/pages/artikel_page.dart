import 'package:flutter/material.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/models/artikel.dart';
import 'package:volundear/pages/artikel_detail.dart';
import 'package:volundear/pages/artikel_form_page.dart';
import 'package:volundear/pages/artikel_search.dart';
import 'package:volundear/pages/login_page.dart';
import 'package:volundear/widgets/artikel_item_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
    final request = context.watch<CookieRequest>();

    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        appBar: AppBar(
          title: const Text("Volundear"),
          backgroundColor: const Color.fromARGB(100, 30, 30, 30),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: SearchArtikel());
              }, 
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )
                );
              },
              icon: const Icon(
                Icons.person,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
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
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
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
                              ),
                            ),
                          ],
                        );
                      }
                    }
                  },
                ),
              )
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: const EdgeInsets.only(left: 30),
              child: FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArtikelForm()),
                ),
                tooltip: 'Tambah Artikel',
                backgroundColor: const Color(0xFF4EC1F3),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
  }
}