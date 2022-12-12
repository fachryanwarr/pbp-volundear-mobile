import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/pages/artikel_page.dart';
import 'package:volundear/pages/daftarWilayah_page.dart';
import 'package:volundear/pages/donasi_page.dart';

class LandingPage extends StatelessWidget {
  final String username = "";

  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Colors.black,
    
      body: ListView(
  children:  <Widget>[
        Container( width: 500,
        height: 330,  
          decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fix1.png'), fit: BoxFit.cover),
                      
                  ),),
        const SizedBox(height: 20,),
                  
    
  
    const Text(
    "About Us",
    style: TextStyle(color: Colors.white, fontSize: 16 ),
    textAlign: TextAlign.left,
    
    ),
    const SizedBox(height: 10,),

    const Text(
    "Volundear merupakan sebuah website yang dapat memfasilitasi para relawan individu yang ingin mengabdikan dirinya pada masyarakat. Selain itu, kami juga ingin menjadi wadah bagi para donatur yang ingin berdonasi. Kami berniat untuk menyatukan berbagai pihak dari berbagai bidang untuk membentuk komunitas di wilayah-wilayah yang belum terjangkau sebagai bentuk pemberdayaan masyarakat di seluruh Indonesia.", 
    style: TextStyle(color: Colors.white, fontSize: 12,),
    textAlign: TextAlign.left,
    
    ), 
    // Card fitur
    const SizedBox(height: 65,),
    const Text(
    "Our Features", 
    style: TextStyle(color: Colors.white, fontSize: 35,),
    textAlign: TextAlign.center,
    ),
  
    Padding(
      padding: const EdgeInsets.all(32.0),
      child: Card(
                  
                  elevation: 12,

                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
              ),
                  child: Container(
                    padding: const EdgeInsets.all(64.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/wilayah.png'),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Daftar Wilayah',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text('Menampilkan seluruh wilayah yang terdaftar, melakukan filter wilayah, dan mendaftarkan diri pada wilayah yang tersedia',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 16),
                            SizedBox(
                          
                    width: 100,
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 53, 13, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      ),
                      onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WilayahPage(username: username)),
                                  ),
                      child: const Text(
                        "Cek di sini",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
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
              
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
            ),
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/donasi.png'),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Donasi',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text('Bersama VolunDear, ambil peranmu untuk bisa bantu saudara-saudara yang terdampak bencana di berbagai wilayah Indonesia.',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 16),
                            SizedBox(
                          
                    width: 100,
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 53, 13, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      ),
                      onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DonasiPage(username: username)),
                                  ),
                     
                      child: const Text(
                        "Cek di sini",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
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
              
               Padding(
                 padding: const EdgeInsets.all(32.0),
                 child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
            ),
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/article.png'),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Artikel',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text('Bersama Volundear, baca dan bagikan artikel seputar berita terkait donasi dan relawan serta berikan komentarmu!',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 16),
                            SizedBox(
                          
                    width: 100,
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 53, 13, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      ),
                      onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ArtikelPage(username:username)),
                                  ),
                      child: const Text(
                        "Cek di sini",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
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
              
               Padding(
                 padding: const EdgeInsets.all(32.0),
                 child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
            ),
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/relawan.png'),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Daftar Relawan',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 5),
                            Text('Mendaftarkan diri sebagai relawan setelah memilih wilayah, mengisi keahlian yang ditawarkan, dan mengisi kesediaan waktu',
                                style: Theme.of(context).textTheme.headline6),
                                
                            const SizedBox(height: 16),
                            SizedBox(
                          
                    width: 100,
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 53, 13, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      ),
                      onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WilayahPage(username: username)),
                                  ),
                      child: const Text(
                        "Cek di sini",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
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
    const SizedBox(height: 80,),
    const Text("   Faq",
        style: TextStyle(color: Colors.white, fontSize: 20,),
        textAlign: TextAlign.left,),
        const SizedBox( height: 10),

        
        const ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Pertanyaan 1', style: TextStyle(color: Colors.black),),
          children: <Widget>[
            ListTile(title: Text('Jawaban 1', style: TextStyle(color: Colors.black),)),
          ],
        ),


        const ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Pertanyaan 2', style: TextStyle(color: Colors.black),),
          children: <Widget>[
            ListTile(title: Text('Jawaban 2', style: TextStyle(color: Colors.black),)),
          ],
        ),


        const ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Pertanyaan 3', style: TextStyle(color: Colors.black),),
          children: <Widget>[
            ListTile(title: Text('Jawaban 3', style: TextStyle(color: Colors.black),)),
          ],
        ),


        const ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Pertanyaan 4', style: TextStyle(color: Colors.black),),
          children: <Widget>[
            ListTile(title: Text('Jawaban 4', style: TextStyle(color: Colors.black),)),
          ],
        ),

        
  ],
),
    );
  }
}
