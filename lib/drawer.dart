import 'package:flutter/material.dart';
import 'package:volundear/main.dart';
import 'package:volundear/pages/artikel_form_page.dart';
import 'package:volundear/pages/artikel_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('LandingPage'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Artikel'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ArtikelPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Form Artikel'),
            onTap: () {
              // Route menu ke halaman form artikel
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ArtikelForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}