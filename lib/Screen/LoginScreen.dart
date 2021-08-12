import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_googlesignin/Screen/MainAppScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    }

    throw 'GOOGLE ERROR';
  }

  void getVerified() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final loginUser = await signInWithGoogle();
                  if (loginUser != null)
                    Navigator.pushNamed(context, MainAppScreen.id);
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
