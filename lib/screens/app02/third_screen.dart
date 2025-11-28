
import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/app02/fourth_screen.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first_screen.dart';
import 'second_screen.dart';

class ThirdScreen extends StatefulWidget{
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: CustomAppBar(title: 'Part 3'),

      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: const Text('Logout', style: TextStyle(fontSize: 25, color: Colors.white, shadows: [BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 3, blurStyle: BlurStyle.outer)]),),
              onPressed: () async {

                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(FirstScreenState.KEYLOGIN, false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SecondScreen()));

              },
            ),

            ElevatedButton(
              child: const Text('Next Screen', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
              onPressed: ()  {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}