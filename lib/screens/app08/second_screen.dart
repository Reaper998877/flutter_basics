import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  bool flag = true;

  ////////////// Method 1 to change flag value
  // @override
  // void initState() {
  //   super.initState();
  //
  //   Timer(Duration(seconds: 4), (){
  //     reload();
  //   });
  // }
  //
  // void reload(){
  //   setState(() {
  //     flag = false;
  //   });
  // }

  // for ripple effect animation
  var listRadius = [100.0, 150.0, 200.0, 250.0, 300.0];

  // Private variables
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // when animation is not initialized _animationController by default sets begin: 0.0 and end: 1.0
    // lowerBound means the value from which animation should start, it ignores value of begin:, default lowerBound value is 0.0
    // upperBound means the value at which animation should end,  it ignores value of end:,  default upperBound value is 1.0
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0.4,
      upperBound: 1.0,
    );

    _animationController.addListener(() {
      debugPrint(
        "${_animationController.value}",
      ); // prints value of animation from 0.0 to 1.0
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: gitLinks["app08b"].toString(),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Hero(
                tag: 'Background', // tag should be same in both activities
                child: Image.asset(
                  'res/img/cat.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Part 2 : Ripple Effect,    Widgets => AnimatedCrossFade',
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

              ////////////////////////////////// Ripple Effect //////////////////////////////////
              Stack(
                alignment: Alignment.center,

                /////////////////////////  Ripple Effect Animation ( Starts when app is opened )

                // children: listRadius.map((radius) {
                //   return Container(
                //     // circle radius should reduce according to _animationController.value
                //     width: radius * _animationController.value, height: radius * _animationController.value,
                //
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       // color opacity decreases that is => starting = high opacity(visible) and ending = low opacity(invisible)
                //       color: Colors.blue.withOpacity(1.0 - _animationController.value)
                //     ),
                //   );
                // }).toList()

                /////////////////////////  Ripple Effect Animation ( with icon at centre )
                children: [
                  buildMyContainer(listRadius[0]),
                  buildMyContainer(listRadius[1]),
                  buildMyContainer(listRadius[2]),
                  buildMyContainer(listRadius[3]),
                  buildMyContainer(listRadius[4]),
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ],
              ),

              ////////////////////////////////// AnimatedCrossFade //////////////////////////////////
              AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: Container(
                  width: 300,
                  height: 300,
                  color: Colors.green,
                ),
                secondChild: Image.asset(
                  'res/img/cat.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
                // crossFadeState: CrossFadeState.showFirst,  // Displays first child
                // crossFadeState: CrossFadeState.showSecond,  // Displays second child

                // if flag is true => displays first child.   if flag is false => displays second child
                crossFadeState: flag
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,

                firstCurve: Curves.elasticIn,
                secondCurve: Curves.fastOutSlowIn,
                sizeCurve: Curves
                    .bounceInOut, // seen when size is different of both widgets
              ),

              ////////////// Method 2 to change flag value
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text(
                  'AnimatedCrossFade',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (flag) {
                    setState(() {
                      flag = false;
                    });
                  } else {
                    setState(() {
                      flag = true;
                    });
                  }
                },
              ),

              ///////////////////////
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Next Screen',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyContainer(radius) {
    return Container(
      // circle radius should reduce according to _animationController.value
      width: radius * _animationController.value,
      height: radius * _animationController.value,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color opacity decreases that is => starting = high opacity(visible) and ending = low opacity(invisible)
        color: Colors.blue.withValues(alpha: 1.0 - _animationController.value),
      ),
    );
  }
}
