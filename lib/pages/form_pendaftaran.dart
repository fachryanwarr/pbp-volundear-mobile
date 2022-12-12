import 'package:flutter/material.dart';
import 'package:volundear/models/daftarWilayah.dart';
import 'package:volundear/fixedWidget/appbar.dart';

class FormPendaftaran extends StatefulWidget {
  const FormPendaftaran({Key? key, required this.wilayah, required this.username}) : super(key: key);

  final Wilayah wilayah;
  final String username;

  @override
  State<FormPendaftaran> createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Column(
        children: [Text(widget.wilayah.pk.toString())],
      ),
    );
  }
}
