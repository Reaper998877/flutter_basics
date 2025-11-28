import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //  Callback Function
  void funcCallBack() {
    debugPrint('Callback Function executed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: '',),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //////////////////////////// Custom Font Adding ////////////////////////////
            const Text(
              'Part 2 : Custom Font Adding,  Callback Function,  Widgets => RichText,    CircleAvatar,    InkWell',
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
        
            //////////////////////////// Callback Function ////////////////////////////
            // funcCallBack is defined above build method
            ElevatedButton(
              onPressed: funcCallBack,
              child: const Text(
                'Button',
                style: TextStyle(fontSize: 25, fontFamily: 'AutourOne'),
              ),
            ),
        
            //////////////////////////// RichText ////////////////////////////
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.cyan,
                  fontSize: 30,
                ),
        
                // Below TextSpan() which don't have fontStyle, color, fontSize will take from above style
                children: <TextSpan>[
                  // this array will take only TextSpan() widget
                  TextSpan(text: 'This '),
        
                  TextSpan(
                    text: 'is ',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
        
                  TextSpan(
                    text: 'Rich Text ',
                    mouseCursor: MouseCursor.defer,
                    spellOut: true,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Capriola',
                    ),
                  ),
        
                  TextSpan(
                    text: 'widget.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        
            //////////////////////////// CircleAvatar ////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Original I.',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 4,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
        
                Text(
                  'Circular I.',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 4,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('res/img/mason.png', height: 80, width: 80),
        
                const CircleAvatar(
                  backgroundImage: AssetImage('res/img/mason.png'),
                  backgroundColor: Colors.cyan,
                  // radius: 40,  // to set height and width
                  minRadius: 40,
                  maxRadius: 40,
                  child: Center(
                    child: Text(
                      'Mason',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('res/img/home.png', height: 80, width: 80),
        
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 40, // to set height and width
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('res/img/home.png', height: 40, width: 40),
                      const Text(
                        'Home',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.amber,
                          shadows: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 4,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        
            //////////////////////////// InkWell ////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //////////////////////// click on empty container ////////////////////////
                InkWell(
                  onTap: () {
                    debugPrint('Single Click on Container');
                  },
                  onLongPress: () {
                    debugPrint('Long Press on Container');
                  },
                  onDoubleTap: () {
                    debugPrint('Double Click on Container');
                  },
                  child: Container(width: 90, height: 50, color: Colors.orange),
                ),
        
                //////////////////////// click on text ////////////////////////
                InkWell(
                  onTap: () {
                    debugPrint('Single Click on Text');
                  },
                  onLongPress: () {
                    debugPrint('Long Press on Text');
                  },
                  onDoubleTap: () {
                    debugPrint('Double Click on Text');
                  },
                  child: const Text(
                    'Click',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan,
                    ),
                  ),
                ),
        
                //////////////////////// click on image ////////////////////////
                InkWell(
                  onTap: () {
                    debugPrint('Single Click on Image');
                  },
                  onLongPress: () {
                    debugPrint('Long Press on Image');
                  },
                  onDoubleTap: () {
                    debugPrint('Double Click on Image');
                  },
                  child: Image.asset('res/img/logout.png', width: 90, height: 90),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
