import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  return AppBar(
    title: const Text("Volundear"),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.person,
        ),
      ),
    ],
  );
}