import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Part 2 : Widgets => TextButton,    ElevatedButton,    OutlinedButton,    IconButton,    Icon,    FaIcon ',
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
          
              // ####################### TextButton #######################
              TextButton(
                child: const Text(
                  "TextButton",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  debugPrint("Pressed on TextButton");
                },
                onLongPress: () {
                  debugPrint("Long Pressed on TextButton");
                },
              ),
          
              // ####################### ElevatedButton #######################
              ElevatedButton(
                child: const Text(
                  "ElevatedButton",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    
                  ),
                ),
                onPressed: () {
                  debugPrint("Pressed on ElevatedButton");
                },
                onLongPress: () {
                  debugPrint("Long Pressed on ElevatedButton");
                },
              ),
          
              // ####################### OutlinedButton #######################
              OutlinedButton(
                child: const Text(
                  "OutlinedButton",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {
                  debugPrint("Pressed on OutlinedButton");
                },
                onLongPress: () {
                  debugPrint("Long Pressed on OutlinedButton");
                },
              ),
          
              // ####################### IconButton #######################
              IconButton(
                icon: const Icon(Icons.add, color: Colors.orange, size: 70),
                onPressed: () {
                  debugPrint('Pressed on IconButton');
                },
              ),
          
              // ####################### Icon #######################
              const Icon(Icons.access_alarm, color: Colors.cyan, size: 60),
              const Icon(
                Icons.account_balance_outlined,
                color: Colors.pinkAccent,
                size: 60,
              ),
          
              // ####################### FaIcon #######################
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(
                    FontAwesomeIcons.apple,
                    color: Colors.grey,
                    size: 80,
                  ), // dependency and import should be added to use FaIcon() widget
                  FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 80),
                  FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 80,
                  ),
                ],
              ),
          
              /////////////////
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop means top activity is removed from Activity Stack
                  Navigator.pop(context);
                },
                child: const Text('Previous Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
