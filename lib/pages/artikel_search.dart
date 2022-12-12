import 'package:flutter/material.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/pages/artikel_detail.dart';
import 'package:volundear/pages/login_page.dart';
import 'package:volundear/widgets/artikel_item_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class SearchArtikel extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  final ArtikelData _artikelData = ArtikelData();

  @override
  Widget buildResults(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: _artikelData.fetchArtikel(query: query),
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
                        if (request.loggedIn) {
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
                        } else {
                          return Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Center(
                                  child: Text(
                                    "Login untuk melihat artikel lebih lengkap",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFe971d7),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(40),
                                      backgroundColor: const Color(0xFFe971d7),
                                  ),
                                  child: const Text('Login'),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                    child: ArtikelItemCard(
                                        artikel: snapshot.data![index],
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(bottom: 12),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    }
                  },
                ),
              )
            )
          ],
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Center(
        child: Text(
          'Search Artikel',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
      ),
    );
  }
}