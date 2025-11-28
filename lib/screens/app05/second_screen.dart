import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: gitLinks["app05b"].toString(),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Part 2 : Widgets => Wrap,    Custom Widget ( Widget created by me )',
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
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pop means top activity is removed from Activity Stack
                  Navigator.pop(context);
                },
                child: const Text(
                  'Previous Screen',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ),
        
            ////////////////////// Wrap //////////////////////
            Wrap(
              // adjusts all widgets according to screen width and height
              direction: Axis
                  .horizontal, // wrap direction either vertical or horizontal
              spacing:
                  30, // if direction is vertical then spacing is applied on top and bottom of widget (opp. for horizontal)
              runSpacing:
                  10, // if direction is vertical then runSpacing is applied on left and right side of widget (opp. for horizontal)
              alignment: WrapAlignment
                  .center, // same as MainAxisAlignment and CrossAxisAlignment  // won't work when both spacing and runSpacing is given
              children: [
                Container(width: 100, height: 100, color: Colors.cyan),
                Container(width: 100, height: 100, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.purple),
                Container(width: 100, height: 100, color: Colors.amber),
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 100, height: 100, color: Colors.teal),
                Container(width: 100, height: 100, color: Colors.lightGreen),
                Container(width: 100, height: 100, color: Colors.pinkAccent),
                Container(width: 100, height: 100, color: Colors.brown),
                Container(width: 100, height: 100, color: Colors.black),
                Container(width: 100, height: 100, color: Colors.cyanAccent),
                Container(width: 100, height: 100, color: Colors.pink),
                Container(width: 100, height: 100, color: Colors.purpleAccent),
                Container(width: 100, height: 100, color: Colors.indigo),
                Container(width: 100, height: 100, color: Colors.indigoAccent),
              ],
            ),
        
            ////////////////////// Custom Widget ( Widget created by me ) //////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 150,
                height: 40,
                child: RoundButton(
                  // RoundButton is a Custom Widget
                  btnName: 'Play',
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  callback: () {
                    debugPrint('Clicked on Play Button');
                  },
                  bgColor: Colors.cyan,
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 150,
                height: 40,
                child: RoundButton(
                  btnName: 'Stop',
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  callback: () {
                    debugPrint('Clicked on Stop Button');
                  },
                  bgColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
