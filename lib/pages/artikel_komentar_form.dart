import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
import 'package:volundear/pages/artikel_page.dart';

class KomentarForm extends StatefulWidget {
  const KomentarForm({super.key});
  @override
  State<KomentarForm> createState() => _KomentarFormState();
}

class _KomentarFormState extends State<KomentarForm> {
  final _formKey = GlobalKey<FormState>();

  final String _model = "artikel.komentar";
  final int _pk = 0;
  final int _artikel = 0;
  int _penulis = 0;
  final String _waktu = (DateTime.now()).toString();
  String _deskripsi = "";

  Future<void> submit(
    BuildContext context, String model, int pk, int artikel, int penulis, String waktu, String deskripsi) async {
    String modelController = model;
    int pkController = pk;
    int pkArtikelController = artikel;
    int penulisController = penulis;
    String waktuController = waktu;
    String deskripsiController = deskripsi;
    final response = await http.post(
        Uri.parse(
            "https://volundear.up.railway.app/artikel/json/"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'model' : modelController,
          'pk': pkController + 1,
          'artikel': pkArtikelController + 1,
          'penulis': penulisController,
          'waktu': waktuController,
          'deskripsi': deskripsiController,
        }));
    // ignore: avoid_print
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Tambahkan Artikel"),
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
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan nama sesuai identitas",
                      labelText: "Nama Penulis",
                      icon: const Icon(Icons.person, 
                      color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _penulis = int.parse(value!);
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _penulis = int.parse(value!);
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
                // Form deskripsi
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan komentar",
                      labelText: "Komentar",
                      icon: const Icon(Icons.text_fields, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            _deskripsi = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            _deskripsi = value!;
                        });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'deskripsi artikel tidak boleh kosong!';
                        }
                        return null;
                    },
                  ),
                ),
                // Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Save button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: 
                        TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFe971d7)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            submit(context, _model, _pk, _artikel, _penulis, _waktu, _deskripsi);
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
                    ),
                    // Back button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFe971d7)),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
