import 'package:flutter/material.dart';
import 'package:volundear/fixedWidget/appbar.dart';
import 'package:volundear/jsons/profile_json.dart';
import 'package:volundear/models/profile.dart';
import 'package:volundear/widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  late Future<List<Profile>> _profile;
  late UserProfile _profileData;

  @override
  void initState() {
    _profileData = UserProfile();
    _profile = _profileData.fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: myAppBar(context),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: FutureBuilder(
              future: _profile,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Belum ada profile :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 89, 0, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                child: ProfileDataCard(
                                  userData: snapshot.data![index],
                                )),
                            padding: const EdgeInsets.only(bottom: 12),
                          ),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ))
        ],
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(padding: const EdgeInsets.only(left: 30),
      //       child: FloatingActionButton(
      //         onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => const EditProfilePage()),
      //         ),
      //         tooltip: 'Edit profile',
      //         backgroundColor: const Color(0xFF4EC1F3),
      //         child: const Icon(Icons.edit),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
