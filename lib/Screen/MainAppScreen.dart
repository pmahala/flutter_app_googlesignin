import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainAppScreen extends StatefulWidget {
  static String id = 'MainAppScreen';
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  late String? userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User signedUser;

  @override
  void initState() {
    // TODO: implement initState

    final user = _auth.currentUser;
    if (user != null) {
      signedUser = user;
      setState(() {
        userEmail = user.email;
        print('userEmail');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userEmail!),
            TextButton(
              onPressed: () async {
                try {
                  await _auth.signOut();
                  await GoogleSignIn().signOut();
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                child: Center(
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ]),
      appBar: AppBar(
        title: Text('MAIN PAGE for'),
      ),
    );
  }
}
