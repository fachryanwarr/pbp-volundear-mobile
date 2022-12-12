import 'package:flutter/material.dart';
import 'package:volundear/pages/login_page.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  return AppBar(
    title: const Text("Volundear"),
    backgroundColor: const Color.fromARGB(100, 30, 30, 30),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              )
          );
        },
        icon: const Icon(
          Icons.person,
        ),
      ),
    ],
  );
}