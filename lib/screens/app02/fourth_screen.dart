import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/app02/fifth_screen.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  var colorsArr = [
    Colors.cyan,
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.teal,
    Colors.deepOrangeAccent,
    Colors.brown,
  ];
  // GridView.builder short form => Gb
  // Next Screen short form => NS
  var nameArr = [
    'Brazil',
    'Belarus',
    'Canada',
    'Iceland',
    'India',
    'Russia',
    'UAE',
    'USA',
  ];
  var imageArr = [
    'res/img/brazil.jpeg',
    'res/img/belarus.jpeg',
    'res/img/canada.jpeg',
    'res/img/iceland.jpeg',
    'res/img/india.jpeg',
    'res/img/russia.jpeg',
    'res/img/uae.jpeg',
    'res/img/usa.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 4'),

      body:
          ////////////////////////////////////// GridView.count //////////////////////////////////////
          // GridView.count(  //  crossAxisCount: 4 => 4 column ( Ignores Device Orientation )
          //   crossAxisCount: 4,
          //   crossAxisSpacing: 10, mainAxisSpacing: 10,
          //   children: [
          //     Container(color: colorsArr[0], child: const Text('GridView.count', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontStyle: FontStyle.italic, shadows: [BoxShadow(color: Colors.black, spreadRadius: 3, blurStyle: BlurStyle.outer, blurRadius: 3)]), softWrap: true,),),
          //     Container(color: colorsArr[1],
          //       child: ElevatedButton(
          //         child: const Text('Next Screen', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
          //         onPressed: (){
          //           // Starts new screen or activity
          //           // Navigator.push means new activity is pushed in stack or Activity Stack
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => const FifthScreen()));
          //         },
          //       ),
          //     ),
          //     Container(color: colorsArr[2]),
          //     Container(color: colorsArr[3]),
          //     Container(color: colorsArr[4]),
          //     Container(color: colorsArr[5]),
          //     Container(color: colorsArr[6]),
          //     Container(color: colorsArr[7]),
          //   ],
          // ),
          ////////////////////////////////////// GridView.extent //////////////////////////////////////
          // GridView.extent(  //  maxCrossAxisExtent: 200 => 200 space is provided to each item
          //   // If Device is Vertical then 2 columns.  // If Device is Horizontal then 4 columns.
          //   // No. of columns changes according to Device Orientation and maxCrossAxisExtent
          //   crossAxisSpacing: 30, mainAxisSpacing: 10,
          //   maxCrossAxisExtent: 200,
          //   children: [
          //     Container(color: colorsArr[0], child: const Text('GridView.extent', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontStyle: FontStyle.italic, shadows: [BoxShadow(color: Colors.black, spreadRadius: 3, blurStyle: BlurStyle.outer, blurRadius: 3)]), softWrap: true,),),
          //     Container(color: colorsArr[1],
          //       child: ElevatedButton(
          //         child: const Text('Next Screen', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
          //         onPressed: (){
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => const FifthScreen()));
          //         },
          //       ),
          //     ),
          //     Container(color: colorsArr[2]),
          //     Container(color: colorsArr[3]),
          //     Container(color: colorsArr[4]),
          //     Container(color: colorsArr[5]),
          //     Container(color: colorsArr[6]),
          //     Container(color: colorsArr[7]),
          //   ],
          // ),
          //////////////////////////////////// GridView.builder //////////////////////////////////////
          GridView.builder(
            padding: EdgeInsets.all(20.0),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    width: 3,
                    color: Colors.red,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 5,
                      blurStyle: BlurStyle.outer,
                      offset: Offset.zero,
                    ),
                  ],
                  shape: BoxShape.rectangle
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FifthScreen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        nameArr[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      // Image.asset(imageArr[index], height: 100, width: 100,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(imageArr[index]),
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: colorsArr.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              mainAxisExtent: 150,
            ),
            // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200, crossAxisSpacing: 5, mainAxisSpacing: 5
            // ),
          ),
    );
  }
}
