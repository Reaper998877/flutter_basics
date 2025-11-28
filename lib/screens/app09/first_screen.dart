import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

// 4th
class _FirstScreenState extends State<FirstScreen> {
  List<Color> colorizeColors = [
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  TextStyle colorizeTextStyle = GoogleFonts.merriweather(
    textStyle: const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Part 1 : GoogleFonts, Widgets => LongPressGesture,    AnimatedTextKit,    Custom_PopupMenuButton',
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
            ////////////////////////////////// LongPressGesture //////////////////////////////////
            const LongPressOverflowText(
              text: 'This is a long text. Long press to see full text!',
            ),
        
            ////////////////////////////////// AnimatedTextKit //////////////////////////////////
            AnimatedTextKit(
              //pause: Duration(milliseconds: 500),
              animatedTexts: [
                ColorizeAnimatedText(
                  speed: const Duration(milliseconds: 400),
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  'AnimatedTextKit Widget',
                ),
              ],
              isRepeatingAnimation: false,
            ),
        
            ////////////////////////////////// Custom_PopupMenuButton //////////////////////////////////
            Container(color: Colors.yellow, child: CustomPopupMenuButton()),
          ],
        ),
      ),
    );
  }
}

class LongPressOverflowText extends StatefulWidget {
  final String text;

  const LongPressOverflowText({super.key, required this.text});

  @override
  LongPressOverflowTextState createState() => LongPressOverflowTextState();
}

class LongPressOverflowTextState extends State<LongPressOverflowText> {
  bool _isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) {
        setState(() {
          _isOverflowing = true;
        });
      },
      onLongPressEnd: (_) {
        setState(() {
          _isOverflowing = false;
        });
      },
      child: Tooltip(
        message: widget.text,
        child: _isOverflowing
            ? SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Text(
                    '${widget.text}entire text to be shown',
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
              )
            : Text(
                widget.text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
              ),
      ),
    );
  }
}
