import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:volundear/pages/daftarWilayah_page.dart';
import 'package:volundear/pages/artikel_page.dart';
import 'package:volundear/pages/donasi_page.dart';
import 'package:volundear/pages/profile_page.dart';
import 'package:volundear/main.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key, required this.selectedNavbar, required this.username}) : super(key: key);

  final int selectedNavbar;
  final String username;

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    int selectedNavbar = 0;

    List bodyContent = [
      MyHomePage(title: "Volundear", username: widget.username),
      WilayahPage(username: widget.username,),
      const Text("ARTIKEL"),
      const DonasiPage(),
      const Text("Community"),
    ];

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(100, 30, 30, 30),
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: const IconThemeData(
        size: 26,
      ),
      unselectedItemColor: const Color.fromARGB(100, 250, 243, 243),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedNavbar,
      onTap: (value) {
        setState(() {
          selectedNavbar = value;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => bodyContent[value],
              )
          );
        });
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Wilayah",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Artikel"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: "Donasi",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Komunitas",
        )
      ],
    );
  }
}
