import 'package:flutter/material.dart';
import 'package:volundear/jsons/artikel_json.dart';
import 'package:volundear/pages/artikel_detail.dart';
import 'package:volundear/widgets/artikel_item_card.dart';

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
        )
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