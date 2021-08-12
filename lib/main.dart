import 'package:flutter/material.dart';
import 'package:flutter_app_googlesignin/Screen/LoginScreen.dart';
import 'package:flutter_app_googlesignin/Screen/MainAppScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        MainAppScreen.id: (context) => MainAppScreen(),
      },
    );
  }
}
