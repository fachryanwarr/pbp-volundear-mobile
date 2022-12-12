import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volundear/models/daftarWilayah.dart';
import 'dart:convert';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/bottom_navbar.dart';
import 'package:volundear/pages/detail_wilayah_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:volundear/pages/form_newWilayah.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key, required this.username}) : super(key: key);

  final String username;

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
    final request = context.watch<CookieRequest>();

    return Scaffold(
      // backgroundColor: const Color.fromARGB(100, 30, 30, 30),
      backgroundColor: const Color(0xff151f2c),
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
              ],
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index)=> Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 30,
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                      //     image: DecorationImage(
                      //       image: AssetImage("assets/images/mountain.jpg"),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "${snapshot.data![index].fields.name}, ${snapshot.data![index].fields.kota}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailWilayah(detail: snapshot.data![index]),
                                  )
                              );
                            },
                            child: const Text("Detail")),
                      )
                    ],
                  ),
                )
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FormWilayah(),
              )
          );
        },
        child: const Icon(Icons.add),

      ),
      bottomNavigationBar: MyBottomNavBar(selectedNavbar: 1, username: widget.username,),
    );
  }
}