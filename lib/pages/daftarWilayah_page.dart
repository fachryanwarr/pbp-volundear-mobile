import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volundear/models/daftarWilayah.dart';
import 'dart:convert';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/bottom_navbar.dart';
import 'package:volundear/pages/detail_wilayah_page.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  State<WilayahPage> createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {

  Future<List<Wilayah>> fetchWilayah() async {
    var url = Uri.parse('https://volundear.up.railway.app/daftarwilayah/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Wilayah
    List<Wilayah> listWilayah = [];
    for (var d in data) {
      if (d != null) {
        listWilayah.add(Wilayah.fromJson(d));
      }
    }

    return listWilayah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context),
        body: FutureBuilder(
          future: fetchWilayah(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada wilayah",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}, ${snapshot.data![index].fields.kota}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailWilayah(detail: snapshot.data![index]),
                                  )
                              );
                            },
                            child: const Text("Lihat selengkapnya"))
                      ],
                    ),
                  )
              );
            }
          },
        ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
