import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var names = [
    'Card',
    'BMW',
    'Cat',
    'Ram',
    'Dog',
    'Eagle',
    'Cocaine',
    'Heroine',
    'Fentanyl',
    'Xylazine',
  ];
  var type = [
    'Widget',
    'Car',
    'Animal',
    'Human',
    'Animal',
    'Bird',
    'Drug',
    'Drug',
    'Drug',
    'Drug',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: gitLinks["app03b"].toString(),),
      body: Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 3),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                elevation: 5,
                color: Colors.amber,
                shadowColor: Colors.amber,
                child: ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    names[index],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan,
                    ),
                  ),
                  subtitle: Text(
                    type[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.yellow,
                      shadows: [AppTheme.boxShadow1],
                    ),
                  ),
                  trailing: const Icon(Icons.access_time_sharp),
                ),
              ),
            );
          },
          itemCount: names.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 4, color: Colors.pink, thickness: 1);
          },
        ),
      ),
    );
  }
}
