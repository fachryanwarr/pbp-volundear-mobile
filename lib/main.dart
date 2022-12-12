import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:volundear/pages/login_page.dart';
import 'package:volundear/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Volundear',
          username: "",
        ),
        routes: {
          "/login-flutter": (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.username});

  final String title;
  final String username;

  Future<void> submitV2(BuildContext context, CookieRequest request) async {
    final response = await request.post(
        'https://volundear.up.railway.app/daftarwilayah/add_new_flutter/', {});
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: const Color(0xff151f2c),
      appBar: myAppBar(context),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text(widget.username)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              },
              child: const Text("GO TO PROFILE")),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedNavbar: 0,
        username: widget.username,
      ),
    );
  }
}
