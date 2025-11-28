import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'third_screen.dart';
import 'second_screen.dart'; // new import + dependency added in pubspec.yaml

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          // if isLoggedIn is true
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ThirdScreen()),
          );
        } else {
          // if isLoggedIn is false
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        }
      } else {
        // if isLoggedIn is null
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber.shade500,
        child: const Center(
          child: Icon(Icons.ac_unit_outlined, color: Colors.red, size: 300),
        ),
      ),
    );
  }
}
