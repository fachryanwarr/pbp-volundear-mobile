import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:volundear/fixedWidget/size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      appBar: myAppBar(context),
      body: Form(
        key: _loginFormKey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
              child: Center(
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(38, 70, 85, 1)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Divider(
                color:
                Color.fromRGBO(38, 70, 85, 1), //color of divider
                height: 1, //height spacing of divider
                thickness: 2, //thickness of divier line
                indent: 140, //spacing at the start of divider
                endIndent: 140, //spacing at the end of divider
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  icon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    username = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    username = value!;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Divider(
                color:
                Color.fromRGBO(38, 70, 85, 1), //color of divider
                height: 1, //height spacing of divider
                thickness: 1, //thickness of divier line
                indent: 25, //spacing at the start of divider
                endIndent: 25, //spacing at the end of divider
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 20),
              child: TextFormField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    splashRadius: 1,
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: togglePasswordView,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    password1 = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    password1 = value!;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Divider(
                color:
                Color.fromRGBO(38, 70, 85, 1), //color of divider
                height: 1, //height spacing of divider
                thickness: 1, //thickness of divier line
                indent: 25, //spacing at the start of divider
                endIndent: 25, //spacing at the end of divider
              ),
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () async {
                  if (_loginFormKey.currentState!.validate()) {
                    // ignore: unused_local_variable
                    final response = await request.login(
                        "https://nutrirobo.up.railway.app/auth/login/",
                        {
                          'username': username,
                          'password': password1,
                        });
                    if (request.loggedIn) {
                      // ignore: use_build_context_synchronously
                      //showAlertDialogSuccess(context, _username);
                    } else {
                      // ignore: use_build_context_synchronously
                      //showAlertDialogFailed(context);
                    }
                  }
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                    const Color.fromARGB(255, 15, 81, 135)),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: SafeArea(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Padding(
      //       padding:
      //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             SizedBox(height: SizeConfig.screenHeight * 0.04),
      //             Text(
      //               "Welcome Back",
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: getProportionateScreenWidth(28),
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             const Text(
      //               "Sign in with your username and password",
      //               textAlign: TextAlign.center,
      //             ),
      //             SizedBox(height: SizeConfig.screenHeight * 0.08),
      //
      //             SizedBox(height: SizeConfig.screenHeight * 0.08),
      //             ElevatedButton(
      //                 onPressed: () {},
      //                 child: const Text("Sign In")),
      //             SizedBox(height: getProportionateScreenHeight(20)),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}
