import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  var arrIndex = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10];
  var colors = [
    Colors.green,
    Colors.indigo,
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.amber,
    Colors.brown,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 4', gitLink: '',),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 200,
          children: arrIndex.map((value) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
