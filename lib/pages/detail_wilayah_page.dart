import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/models/daftarWilayah.dart';

class DetailWilayah extends StatelessWidget {
  const DetailWilayah({Key? key, required this.detail}) : super(key: key);

  final Wilayah detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Text(detail.fields.name),
    );
  }
}
