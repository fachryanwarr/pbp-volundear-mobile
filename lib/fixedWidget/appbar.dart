import 'package:flutter/material.dart';
import 'package:volundear/pages/profiles_menu.dart';

PreferredSizeWidget myAppBar(BuildContext context) {

  return AppBar(
    title: const Text("Volundear"),
    backgroundColor: const Color.fromARGB(100, 30, 30, 30),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileMenu(),
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