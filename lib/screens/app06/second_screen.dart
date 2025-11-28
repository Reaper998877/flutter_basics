import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: gitLinks["app06b"].toString(),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Part 2 : Container with Gradient Background,  Widgets => SizedBox [expand, shrink, square]',
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

              /////////////////////////////// SizedBox ///////////////////////////////
              // SizedBox is used when u want to give only width and height to a widget
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Clicked on button inside SizedBox widget');
                    },
                    child: const Text(
                      'SizedBox',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              /////////////// SizedBox.expand => takes max width and height of parent widget
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 300,
                  height: 150, // maxWidth = width and maxHeight = height
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint(
                          'Clicked on button inside SizedBox.expand widget',
                        );
                      },
                      child: const Text(
                        'SizedBox.expand',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50), // for spacing between two widgets
              /////////////// SizedBox.shrink => takes min width and height of parent widget
              // Default min width and min height is zero for all widgets so it won't be displayed thats why ConstrainedBox() is used
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 30, minWidth: 200),
                child: SizedBox.shrink(
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(
                        'Clicked on button inside SizedBox.shrink widget',
                      );
                    },
                    child: const Text(
                      'SizedBox.shrink',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              /////////////// SizedBox.square => used for square box
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox.square(
                  dimension: 200, // all sides of square are 160
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(
                        'Clicked on button inside SizedBox.square widget',
                      );
                    },
                    child: const Text(
                      'SizedBox.square',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              /////////////////////////////// Container with Gradient Background ///////////////////////////////
              //////////////////// LinearGradient means colors in vertical or horizontal manner
              Container(
                width: 410,
                height: 410,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // colors: [  Colors.red, Colors.amber  ],  // method 1
                    colors: [
                      // method 2
                      Color(
                        0xffffecd2,
                      ), // 0xff means color is full visible  // ffecd2 is color's hex code
                      Color(
                        0xfffcb69f,
                      ), // 0x00 means color is tranparent    // fcb69f is color's hex code
                      Color(0xffff9b7e),
                    ],

                    //////////// Screen Coordinates not widget attributes
                    //# topLeftCorner (0, 0)      //#  topRightCorner (1, 0)       //# center (0.5, 0.5)
                    //# bottomLeftCorner (0, 1)   //#  bottomRightCorner (1, 1)

                    // begin: Alignment.center, // spreads 1st color of array till center of Container
                    begin: FractionalOffset(1.0, 0.5),
                    end: FractionalOffset(0.0, 0.5),
                    stops: [
                      0.2,
                      0.8,
                      1,
                    ], // 1st color 0 to 0.2, 2nd c 0.2 to 0.8, 3rd c 0.8 to 1
                  ),
                ),
              ),

              SizedBox(height: 50),
              //////////////////// RadialGradient means colors in circular manner
              Container(
                width: 410,
                height: 410,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.purple, Colors.amber, Colors.orange],
                    radius: 0.5,
                    center: Alignment
                        .center, // to adjust the circle according to you
                    stops: [0.5, 0.7, 1],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
