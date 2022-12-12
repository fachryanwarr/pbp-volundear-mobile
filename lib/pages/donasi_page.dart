import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: const Color(0xff151f2c),
        appBar: myAppBar(context),
        // Menambahkan drawer menu
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Text(
                "Donasi",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),),
              CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: [
        Image.asset('assets/images/gambar3.webp'),
        Image.asset('assets/images/gambar2.jpeg'),
        Image.asset('assets/images/36951-ui.jpeg'),
      ],
    ),
    const Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Text(
                "Volundear terus berupaya memberikan bantuan terbaik dengan merespon capat dan tepat untuk mendistribusikan berbagai kebutuhan dasar agar dapat menekan risiko yang lebih parah akibat bencana. Mari kita bergandeng tangan untuk membersamai saudara-saudara kita yang saat ini sedang mendapatkan musibah. Bersama Volundear, ambil peranmu untuk bisa bantu saudara-saudara yang terdampak bencana di berbagai wilayah Indonesia.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              textAlign: TextAlign.justify,
              ),),
          const Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Text(
                "#DonaDear",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),),
            Expanded(
              child: Center(
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
        ),
            )
          ],
        )
      );
  }
}