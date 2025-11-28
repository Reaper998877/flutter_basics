import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // for AnimatedContainer widget
  var _width =
      300.0; // when underscore is prefix of variable it is a private variable
  var _height = 150.0;
  var _color = Colors.amber;
  var _radius = 20.0;
  bool flag = true;

  // for AnimatedOpacity widget
  var _opacity = 1.0;
  bool mark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: '',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Part 1 : Widgets => AnimatedContainer,    AnimatedOpacity,    Hero,',
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
          
              ////////////////////////////////// AnimatedContainer //////////////////////////////////
              AnimatedContainer(
                width: _width,
                height: _height,
                margin: const EdgeInsets.all(20),
                duration: const Duration(seconds: 3),
                curve: Curves
                    .elasticInOut, // In android java it is known as interpolator
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_radius),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      spreadRadius: 4,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  border: Border.all(
                    width: 5,
                    color: Colors.red,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
          
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  setState(() {
                    if (flag) {
                      _width = 200.0;
                      _height = 200.0;
                      _radius = 100.0;
                      _color = Colors.blue;
                      flag = false;
                    } else {
                      _width = 300.0;
                      _height = 150.0;
                      _radius = 20.0;
                      _color = Colors.amber;
                      flag = true;
                    }
                  });
                },
                child: const Text(
                  'AnimatedContainer',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
              ),
          
              ////////////////////////////////// AnimatedOpacity //////////////////////////////////
              AnimatedOpacity(
                duration: const Duration(seconds: 3),
                opacity: _opacity, // same as alpha in android java
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        spreadRadius: 4,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    border: Border.all(
                      width: 5,
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
          
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  setState(() {
                    if (mark) {
                      _opacity = 0.0;
                      mark = false;
                    } else {
                      _opacity = 1.0;
                      mark = true;
                    }
                  });
                },
                child: const Text(
                  'AnimatedOpacity',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
          
              ////////////////////////////////// Hero //////////////////////////////////
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: Hero(
                  tag: 'Background', // tag should be same in both activities
                  child: Image.asset('res/img/cat.jpg', height: 150, width: 150),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
