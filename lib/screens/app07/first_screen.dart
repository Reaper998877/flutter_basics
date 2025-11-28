import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

// 4th
class _FirstScreenState extends State<FirstScreen> {
  var c1 = TextEditingController();
  RangeValues values = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: '',),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Text(
                'Part 1 : Passing Data from One Screen to Another Screen,  Widgets => Expanded,  RangeSlider',
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
        
            ////////////////////// Expanded //////////////////////
            // Expanded widget is mainly used in Column and Row widget
        
            ////// Use of Expanded widget in Column
            // In Column widget flex works on height
            // width: double.infinity means width of screen
            Expanded(
              flex: 1,
              child: Container(width: double.infinity, color: Colors.amber),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: c1,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.yellow, width: 3),
                        ),
                      ),
                      style: const TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(width: double.infinity, color: Colors.green),
            ),
            Expanded(
              flex: 3,
              child: Container(width: double.infinity, color: Colors.cyanAccent),
            ),
        
            const SizedBox(height: 50),
            ////// Use of Expanded widget in Row
            // In Row widget flex works on width
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(height: 150, color: Colors.blue),
                ),
                Expanded(
                  flex: 2,
                  child: Container(height: 150, color: Colors.brown),
                ),
                Expanded(
                  flex: 4,
                  child: Container(height: 150, color: Colors.red),
                ),
                Expanded(
                  flex: 3,
                  child: Container(height: 150, color: Colors.deepPurple),
                ),
              ],
            ),
        
            ////////////////////// RangeSlider //////////////////////
            RangeSlider(
              values: values,
              labels: labels,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade100,
              divisions: 10,
              min: 0,
              max: 100,
              onChanged: (newValue) {
                values = newValue;
                debugPrint('${newValue.start}, ${newValue.end}');
                setState(() {});
              },
            ),
        
            ////////////////////// Passing Data from One Screen to Another Screen //////////////////////
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(c1.text.toString().trim()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: const Text(
                'Next Screen',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
