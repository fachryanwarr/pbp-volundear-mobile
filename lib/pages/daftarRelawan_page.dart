import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/bottom_navbar.dart';

class RelawanPage extends StatefulWidget {
  const RelawanPage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<RelawanPage> createState() => _RelawanPageState();
}

class _RelawanPageState extends State<RelawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
      bottomNavigationBar: MyBottomNavBar(selectedNavbar: 4,username: widget.username,),
    );
  }
}
