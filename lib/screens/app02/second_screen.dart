import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'third_screen.dart';
import 'first_screen.dart'; // dependency added in pubspec.yaml

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // static const String KEYEMAIL = "Email";  // KEYEMAIL can be used as key instead of Email
  var emailValue = "";
  var passwordValue = "";

  @override
  void initState() {
    super.initState();

    getValue();
  }

  // async keyword cannot be used on initState
  void getValue() async {
    var savedPrefs = await SharedPreferences.getInstance();

    var email = savedPrefs.getString('Email');
    var password = savedPrefs.getString('Password');

    // checks if Email is null or not. If null then emailValue = "No email" else emailValue = Email
    emailValue = email ?? "No email";
    passwordValue = password ?? "No password";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: '',),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.account_circle, size: 200, color: Colors.blue),
                TextField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                  cursorHeight: 25.0,
                  decoration: InputDecoration(
                    label: const Text('Email'),
                      
                     isCollapsed: true,
                    contentPadding: EdgeInsets.all(6.0),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green, width: 3),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: passwordController, cursorHeight: 25.0,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(6.0),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.deepOrange,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green, width: 3),
                    ),
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurRadius: 3,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    var email = emailController.text.toString().trim();
                    var password = passwordController.text.toString().trim();
            
                    // 1 // SharedPreferences may take time to get data from local storage and during that time app ui will be hold or waiting so to prevent this await keyword is used for SharedPreferences.
                    // 2 // await keyword makes SharedPreferences process in background so app ui won't wait or hold.
                    // 3 // when await is used in any function that function should have async keyword
                    // 4 // when any task is inside Future<> it should have await keyword
                    // example Future<SharedPreferences>
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('Email', email);
                    prefs.setString('Password', password);
                    prefs.setBool(FirstScreenState.KEYLOGIN, true);
            
                    if (email.isEmpty && password.isEmpty) {
                      debugPrint("Enter Email and Password");
                    } else {
                      debugPrint("Email : $email \n Password : $password");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30.0),
                Text(
                  '$emailValue \n$passwordValue',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
