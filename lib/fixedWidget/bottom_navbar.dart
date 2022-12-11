import 'package:flutter/material.dart';
import 'package:volundear/pages/daftarWilayah_page.dart';
import 'package:volundear/pages/artikel_page.dart';
import 'package:volundear/pages/donasi_page.dart';
import 'package:volundear/pages/profile_page.dart';
import 'package:volundear/main.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  int _selectedNavbar = 0;
  List bodyContent = [
    const MyApp(),
    const WilayahPage(),
    const Text("ARTIKEL"),
    const Text("DONASI"),
    const Text("Community"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: const IconThemeData(
        size: 26,
      ),
      unselectedItemColor: Colors.black45,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedNavbar,
      onTap: (value) {
        setState(() {
          _selectedNavbar = value;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => bodyContent[_selectedNavbar],
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
