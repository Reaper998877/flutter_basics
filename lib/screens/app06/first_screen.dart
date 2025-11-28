import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

// 4th
class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: '',),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Part 1 : Custom Styles and Themes,  Widgets => ClipRRect',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2,
                    ),
                  ],
                ),
                softWrap: true,
              ),

              ////////////////////// Splash Screen //////////////////////
              // Splash Screen code is in SplashScreen.dart file and in main.dart  home: SplashScreen();

              ////////////////////// Custom Styles and Themes //////////////////////
              // copyWith() is used to add extra attribute to any theme for a specific widget
              // ! checks whether textTheme.titleMedium is initialized or not. Same for textTheme.displayLarge
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'textTheme.displayLarge 1',
                  style: AppTheme.app06Theme.textTheme.displayLarge!.copyWith(
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'textTheme.displayLarge 2',
                  style: AppTheme.app06Theme.textTheme.displayLarge!.copyWith(
                    fontStyle: FontStyle.italic,
                    backgroundColor: Colors.orange.shade400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'textTheme.titleMedium',
                  style: AppTheme.app06Theme.textTheme.titleMedium!.copyWith(
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'myTextStyle1',
                  style: AppTheme.textStyle2(textColor: Colors.pink),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('myTextStyle2', style: AppTheme.textStyle3),
              ),

              ////////////////////// ClipRRect //////////////////////
              ClipRRect(
                // ClipRRect is used to give custom shape to Container, Image and so on.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ), // ClipRRect is used to give custom shape to Container, Image and so on.
                child: Container(width: 200, height: 200, color: Colors.indigo),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Image.asset(
                    'res/img/cat.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //////////////////////
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: Text(
                  'Next Screen',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
