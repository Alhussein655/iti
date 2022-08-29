import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti/auth/login_screen.dart';
import 'package:iti/auth/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ITI());
}

class ITI extends StatelessWidget {
  const ITI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
