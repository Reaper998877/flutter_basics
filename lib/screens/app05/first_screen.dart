import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Part 1 : Container Decoration,  Margin,  Widgets => Padding',
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

              ////////////////////// Container Decoration //////////////////////
              Container(
                color: Colors.cyanAccent,
                width: 250,
                height: 250,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.pink,

                      /////////////////////////////////////// BorderRadius ///////////////////////////////////////
                      // borderRadius: BorderRadius.circular(10),  // all curved corners

                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),  // specified curved corners using Radius.circular()
                      // borderRadius: BorderRadius.only(topRight: Radius.elliptical(50,80), bottomLeft: Radius.elliptical(50,80)),  // specified curved corners using Radius.elliptical()

                      // borderRadius: BorderRadius.zero,  // all corners as it is
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ), // all curved corners
                      // borderRadius: BorderRadius.all(Radius.zero),  // all corners as it is
                      // borderRadius: BorderRadius.all(Radius.elliptical(30, 50)),  // all curved corners using Radius.elliptical()

                      /////////////////////////////////////// Border ///////////////////////////////////////
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                        style: BorderStyle.solid,
                        // strokeAlign: BorderSide.strokeAlignOutside
                        // strokeAlign: BorderSide.strokeAlignInside
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),

                      /////////////////////////////////////// boxShadow ///////////////////////////////////////
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          spreadRadius: 5,
                          // blurStyle: BlurStyle.solid,
                          // blurStyle: BlurStyle.inner,
                          // blurStyle: BlurStyle.normal,
                          blurStyle: BlurStyle.outer,
                          // offset: Offset.infinite,
                          offset: Offset.zero,
                        ),
                      ],

                      /////////////////////////////////////// shape ///////////////////////////////////////
                      // to use this first remove BorderRadius
                      // shape: BoxShape.circle
                      // shape: BoxShape.rectangle
                    ),
                  ),
                ),
              ),

              ////////////////////// Padding //////////////////////
              Row(
                children: [
                  //// All side padding
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                      child: Center(
                        child: Text('PItem 1', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),

                  //// Specific side padding
                  // Padding(  padding: const EdgeInsets.only(left: 10, right: 10),
                  //   child: Container(  width: 100, height: 100, color: Colors.cyanAccent, child: Center(child: Text('PItem 2' , style: TextStyle(fontSize: 20),)), ),
                  // ),

                  //// All side same or different padding
                  // Padding(  padding: const EdgeInsets.fromLTRB(10, 30, 10, 60),
                  //   child: Container(  width: 100, height: 100, color: Colors.green, child: Center(child: Text('PItem 3' , style: TextStyle(fontSize: 20),)), ),
                  // ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                    child: Center(
                      child: Text('PItem 4', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),

              ////////////////////// Margin //////////////////////
              Column(
                children: [
                  //// All side same or different margin
                  // Container(  width: 100, height: 100, margin: EdgeInsets.fromLTRB(10, 30, 10, 60), color: Colors.pink, child: Center(child: Text('MItem 1' , style: TextStyle(fontSize: 20),)), ),

                  //// Specific side margin
                  // Container(  width: 100, height: 100, margin: EdgeInsets.only(top: 40, bottom: 60), color: Colors.amber, child: Center(child: Text('MItem 2' , style: TextStyle(fontSize: 20),)), ),

                  //// All side margin
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(20),
                    color: Colors.cyan,
                    child: Center(
                      child: Text('MItem 3', style: TextStyle(fontSize: 20)),
                    ),
                  ),

                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text('MItem 4', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),

              //////////////////////
              ElevatedButton(
                child: const Text(
                  'Next Screen',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                onPressed: () {
                  // Starts new screen or activity
                  // Navigator.push means new activity is pushed in stack or Activity Stack
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
