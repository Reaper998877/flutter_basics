import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with SingleTickerProviderStateMixin {
  late Animation
  animation; // late means animation will be initialized afterwards
  late Animation colorAnimation;
  late AnimationController animationController; // controls animation

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    // Tween() brings values from begin (0.0) to end (200.0) within given duration
    animation = Tween(begin: 10.0, end: 200.0).animate(animationController);

    // ColorTween() brings color hex values from begin (pink - E91E63) to end (indigo - 3F51B5) within given duration
    colorAnimation = ColorTween(
      begin: Colors.pink,
      end: Colors.indigo,
    ).animate(animationController);

    // There are many more Tween animation which starts like this
    // ...Tween()  ... means any attribute like color, borderRadius, border and so on

    animationController.addListener(() {
      // print(animation.value);
      setState(() {});
    });

    animationController.forward(); // starts animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 3', gitLink: gitLinks["app08c"].toString(),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Part 3 : Tween,    ColorTween',
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

            ////////////////////////////////// Tween and ColorTween //////////////////////////////////
            Container(
              // height, width and color is initialized according to values provided by animation.value
              width: animation.value,
              height: animation.value,
              decoration: BoxDecoration(color: colorAnimation.value),
            ),
          ],
        ),
      ),
    );
  }
}
