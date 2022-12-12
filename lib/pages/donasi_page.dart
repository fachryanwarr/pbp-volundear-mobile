import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/jsons/donasi_json.dart';

import '../models/donasi.dart';
import '../widgets/donasi_item_card.dart';

class DonasiPage extends StatefulWidget {
    const DonasiPage({Key? key}) : super(key: key);

    @override
    State<DonasiPage> createState() => _DonasiPage();
}

class _DonasiPage extends State<DonasiPage> {
    late Future<List<Donasi>> _donasi;
    late DonasiData _donasiData;
    
    @override
    void initState() {
      _donasiData = DonasiData();
      _donasi = _donasiData.fetchDonasi();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        appBar: myAppBar(context),
        // Menambahkan drawer menu
        body: Center(
          child: FutureBuilder(
            future: _donasi,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Belum ada donasi :(',
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
                          child: DonasiItemCard(
                              donasi: snapshot.data![index],
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