import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/pages/artikel_page.dart';

class ArtikelForm extends StatefulWidget {
  const ArtikelForm({super.key});
  @override
  State<ArtikelForm> createState() => _ArtikelFormState();
}

class _ArtikelFormState extends State<ArtikelForm> {
  final _formKey = GlobalKey<FormState>();

  String judul = "";
  String pembuka = "";
  String isi = "";

  void add(request, judul, pembuka, isi) async {
    await request.post('', {
      "judul": judul,
      "pembuka": pembuka,
      "isi": isi
    });
  }

  Future<void> submit(
    BuildContext context, String judul, String pembuka, String isi) async {
    String judulController = judul;
    String pembukaController = pembuka;
    String isiController = isi;
    final response = await http.post(
        Uri.parse(
            "https://volundear.up.railway.app/artikel/json/"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'judul': judulController,
          'pembuka': pembukaController,
          'isi': isiController,
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: myAppBar(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tuliskan Artikelmu!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Form Judul
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
                      hintText: "Isi dengan judul artikel",
                      labelText: "Judul Artikel",
                      icon: const Icon(Icons.title, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            judul = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            judul = value!;
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
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan kalimat pembuka artikel",
                      labelText: "Pembuka Artikel",
                      icon: const Icon(Icons.text_fields, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            pembuka = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            pembuka = value!;
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
                    style: const TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Isi dengan isi artikel",
                      labelText: "Isi Artikel",
                      icon: const Icon(Icons.text_fields, 
                            color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    // Menambahkan behavior saat judul diketik 
                    onChanged: (String? value) {
                        setState(() {
                            isi = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            isi = value!;
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
                            submit(context, judul, pembuka, isi);
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
