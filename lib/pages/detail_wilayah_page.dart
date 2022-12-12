import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/models/daftarWilayah.dart';
import 'package:volundear/fixedWidget/size_config.dart';

class DetailWilayah extends StatelessWidget {
  const DetailWilayah({Key? key, required this.detail}) : super(key: key);

  final Wilayah detail;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    final DateTime tanggalAwal = detail.fields.awalPeriode;
    final String tanggal1 = "${tanggalAwal.day}-${tanggalAwal.month}-${tanggalAwal.year}";

    final DateTime tanggalAkhir = detail.fields.akhirPeriode;
    final String tanggal2 = "${tanggalAkhir.day}-${tanggalAkhir.month}-${tanggalAkhir.year}";

    return Scaffold(
      backgroundColor: const Color(0xff151f2c),
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 0.35 * SizeConfig.screenHeight,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/mountain.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Container(
                color: const Color(0xff172331),
                width: SizeConfig.screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Co
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        detail.fields.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        detail.fields.kota,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),),

                    SizedBox(height: SizeConfig.screenHeight * 0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            "Awal periode",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),),
                        Padding(
                          padding: EdgeInsets.only(right: 15, top: 10),
                          child: Text(
                            "Akhir periode",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            tanggal1,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 10),
                          child: Text(
                            tanggal2,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),)
                      ],
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.05),

                    Center(
                      child: Container(
                        width: 0.8 * SizeConfig.screenWidth,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                                "Daftar"
                            )),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
