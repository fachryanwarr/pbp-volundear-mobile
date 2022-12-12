import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/size_config.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:volundear/pages/daftarWilayah_page.dart';

class FormWilayah extends StatefulWidget {
  const FormWilayah({Key? key}) : super(key: key);

  @override
  State<FormWilayah> createState() => _FormWilayahState();
}

class _FormWilayahState extends State<FormWilayah> {
  final _newWilayahKey = GlobalKey<FormState>();

  List<String> daftarKebutuhan = ["Tenaga Medis", "Pengajar SD", "Pengajar SMP",
    "Pengajar SMA", "Ahli Lingkungan", "Ahli Infrastruktur", "Pemanfaatan Sumber Daya"];

  TextEditingController dateCtl = TextEditingController();

  String nama = "";
  String kota = "";
  String alamat = "";
  String kebutuhan = "Tenaga Medis";
  String kuotaMax = "";
  String kuotaTerisi = "";
  String deskripsi = "";
  DateTime awalPeriode = DateTime.now();
  DateTime akhirPeriode = DateTime.now();

  Future<void> submitV2(BuildContext context, CookieRequest request) async {
    await request.post(
        'https://volundear.up.railway.app/daftarwilayah/add_new_flutter/',
        {
          'name' : nama,
          'kota':kota,
          'address':alamat,
          'kuota_max':kuotaMax,
          'description':kuotaTerisi,
          'kebutuhan':kebutuhan,
          'awal_periode':awalPeriode.toString(),
          'akhir_periode':akhirPeriode.toString(),
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: const Color(0xff151f2c),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding (
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Form(
                key: _newWilayahKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)
                      ),
                      child: Text(
                        "Masukkan Data Wilayah",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          labelText: "Nama Wilayah",
                          icon: const Icon(
                            Icons.map_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            nama = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            nama = value!;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama wilayah tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          labelText: "Nama Kota",
                          icon: const Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            kota = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            kota = value!;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field kota tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          labelText: "Alamat Lengkap",
                          icon: const Icon(
                            Icons.place,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            alamat = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            alamat = value!;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field alamat tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: DropdownButtonFormField(
                        dropdownColor: const Color(0xff151f2c),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.add_box_outlined, color: Colors.white,)
                        ),
                        value: kebutuhan,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                        items: daftarKebutuhan.map((String items) {
                          return DropdownMenuItem(

                            value: items,
                            child: Text(items,
                              style: const TextStyle(fontSize: 17, color: Colors.white),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            kebutuhan = newValue!;
                          });
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          labelText: "Deskripsi",
                          icon: const Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            deskripsi = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            deskripsi = value!;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          labelText: "Jumlah Relawan Dibutuhkan",
                          icon: const Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            kuotaMax = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            kuotaMax = value!;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jumlah relawan dibutuhkan tidak boleh 0";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Awal Periode",
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () async{
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate:DateTime.now(),
                                firstDate:DateTime(1900),
                                lastDate: DateTime(2100)))!;

                            awalPeriode = date;

                            dateCtl.text = date.toIso8601String();},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Tanggal awal periode tidak boleh kosong";
                            }
                            return null;
                          },
                        )
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Akhir Periode",
                            icon: const Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () async{
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate:DateTime.now(),
                                firstDate:DateTime(1900),
                                lastDate: DateTime(2100)))!;

                            akhirPeriode = date;

                            dateCtl.text = date.toIso8601String();
                            },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Tanggal akhir periode tidak boleh kosong";
                            }
                            return null;
                          },
                        )
                    ),

                    Container(
                      height: 50,
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_newWilayahKey.currentState!.validate()) {
                            // ignore: unused_local_variable
                            submitV2(context, request);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Thanks! You just create an article for the world.',
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WilayahPage(username: "")),
                                                  (Route<dynamic> route) => false);
                                        },
                                        child: const Text('Back'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Tambah",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),

                    const Padding(padding: EdgeInsets.all(10)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}