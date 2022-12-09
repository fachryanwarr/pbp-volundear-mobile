import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/pages/artikel_page.dart';

class ArtikelForm extends StatefulWidget {
  const ArtikelForm({super.key});
  @override
  State<ArtikelForm> createState() => _ArtikelFormState();
}

class _ArtikelFormState extends State<ArtikelForm> {
  final _formKey = GlobalKey<FormState>();

  String _penulis = "";
  String _judul = "";
  final String _rilis = (DateTime.now()).toString();
  String _pembuka = "";
  String _isi = "";

  Future<void> submit(
      BuildContext context, String penulis, String judul, String rilis, String pembuka, String isi) async {
    String penulisController = penulis;
    String judulController = judul;
    String rilisController = rilis;
    String pembukaController = pembuka;
    String isiController = isi;
    final response = await http.post(
        Uri.parse(
            "https://volundear.up.railway.app/artikel/json/"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'penulis': penulisController,
          'judul': judulController,
          'rilis': rilisController,
          'pembuka': pembukaController,
          'isi': isiController,
        }));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Silahkan isi form berikut ini"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Form Penulis
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Isi dengan nama sesuai identitas",
                      labelText: "Nama Penulis",
                      icon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _penulis = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _penulis = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Nama penulis tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Judul
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Isi dengan judul artikel",
                      labelText: "Judul Artikel",
                      icon: const Icon(Icons.title),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Judul artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Pembuka
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Isi dengan kalimat pembuka artikel",
                      labelText: "Pembuka Artikel",
                      icon: const Icon(Icons.text_fields),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _pembuka = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _pembuka = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Pembuka artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Form Isi
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Isi dengan isi artikel",
                      labelText: "Isi Artikel",
                      icon: const Icon(Icons.text_fields),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _isi = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _isi = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Isi artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Save button
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submit(context, _penulis, _judul, _rilis,_pembuka,_isi);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ArtikelPage()),
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
