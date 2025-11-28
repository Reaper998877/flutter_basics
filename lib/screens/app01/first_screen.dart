import 'package:flutter/material.dart';
import 'package:flutter_basics/screens/app01/second_screen.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Allows to take multiple widget inside it
          
            // @@@@@@@@@ mainAxisAlignment is vertical in Column
            // @@@@@@@@@ crossAxisAlignment is horizontal in Column
          
            // mainAxisAlignment: MainAxisAlignment.center,        // brings column widget children at center
            // mainAxisAlignment: MainAxisAlignment.end,           // brings column widget children at bottom
            // mainAxisAlignment: MainAxisAlignment.start,         // brings column widget children at top
            // mainAxisAlignment: MainAxisAlignment.spaceAround,   // distributes equal space above and below each child
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,  // distributes equal space between each child
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // distributes equal space between each child within given height and width
          
            // crossAxisAlignment: CrossAxisAlignment.stretch,  // stretches specific child just like match parent in java
            // crossAxisAlignment: CrossAxisAlignment.start,    // brings column widget children at left
            // crossAxisAlignment: CrossAxisAlignment.end,      // brings column widget children at right
            // crossAxisAlignment: CrossAxisAlignment.center,   // brings column widget children at center
            children: [// Multiple child array => children
              const Text(
                'Part 1 : Navigation,  Widgets => Column,    Row,    Text,    Container,    Center,    Image ',
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
          
              const Text(
                'Text1 Inside Column Widget',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
                softWrap: true,
              ),
          
              const Text(
                'Text2 Inside Column Widget',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ), // by default softWrap is true for all Text()
          
              const Text(
                'Text3 Inside Column Widget',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  backgroundColor: Colors.red,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
          
              ////////////////////// Image //////////////////////
              Image.asset(
                'res/img/cat.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
              //  BoxFit.fill means image is stretched according to given height and width
          
              ////////////////////// Container and Row //////////////////////
              Container(
                color: Colors.white,
                height: 70,
                width: double.infinity,
                child: Row(
                  // allows to take multiple widget inside it
          
                  // @@@@@@@@@ mainAxisAlignment is horizontal in row
                  // @@@@@@@@@ crossAxisAlignment is vertical in row
          
                  // mainAxisAlignment: MainAxisAlignment.center,        // brings row widget children at center
                  // mainAxisAlignment: MainAxisAlignment.end,           // brings row widget children at right
                  // mainAxisAlignment: MainAxisAlignment.start,         // brings row widget children at left
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,   // distributes equal space to left and right of each child
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,  // distributes equal space between each child
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // distributes equal space between each child within given height and width
          
                  // crossAxisAlignment: CrossAxisAlignment.stretch,  // stretches specific child just like match parent in java
                  // crossAxisAlignment: CrossAxisAlignment.start,    // brings row widget children at top
                  // crossAxisAlignment: CrossAxisAlignment.end,      // brings row widget children at bottom
                  // crossAxisAlignment: CrossAxisAlignment.center,   // brings row widget children at center
                  children: [
                    const Text(
                      'Text Inside Row',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Image.asset('res/img/logout.png', height: 50, width: 50),
                    Image.asset('res/img/clock.png', height: 50, width: 50),
                  ],
                ),
              ),
          
              ////////////////////// One Screen to Another Screen //////////////////////
              ElevatedButton(
                child: const Text('Next Screen'),
                onPressed: () {
                  // Starts new screen or activity
                  // Navigator.push means new activity is pushed in stack or Activity Stack
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
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
