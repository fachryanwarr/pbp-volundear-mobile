import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/size_config.dart';
import 'package:volundear/pages/artikel_page.dart';

class KomentarForm extends StatefulWidget {
  const KomentarForm({super.key});
  @override
  State<KomentarForm> createState() => _KomentarFormState();
}

class _KomentarFormState extends State<KomentarForm> {
  final _formKey = GlobalKey<FormState>();

  String deskripsi = "";

  void add(request, deskripsi) async {
    await request.post('', {
      "deskripsi": deskripsi,
    });
  }

  Future<void> submit(
    BuildContext context, String deskripsi) async {
    String deskripsiController = deskripsi;
    final response = await http.post(
        Uri.parse(
            "https://volundear.up.railway.app/artikel/json/"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'deskripsi': deskripsiController,
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
                    "Tuliskan Komentarmu!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                            deskripsi = value!;
                        });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                        setState(() {
                            deskripsi = value!;
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
                            submit(context,deskripsi);
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
