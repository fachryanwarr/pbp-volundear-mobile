import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/fixedWidget/size_config.dart';
import 'package:volundear/pages/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:volundear/main.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      backgroundColor: const Color(0xff151f2c),
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Container(
                  height: 50,
                  width: SizeConfig.screenWidth * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),

                  child: (request.loggedIn) ? TextButton(
                    onPressed: () async {
                      await request.logout(
                          'https://volundear.up.railway.app/auth/logout');

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: 'Volundear', username: "")),
                              (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ) : TextButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          )
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
