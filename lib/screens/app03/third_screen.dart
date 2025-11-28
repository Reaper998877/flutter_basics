import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  var arrNames = [
    'Mapping single array in listview',
    'Cocaine',
    'Nicotine',
    'Xylazine',
    'Fentanyl',
    'Opium',
    'Heroin',
    'HNO3',
    'NH3',
    'AlCl3',
  ];
  var arrData = [
    // maps inside array
    {
      'name': 'Mapping multiple arrays in listview',
      'mobno': '1234',
      'unread': '3',
    },
    {'name': 'Rahul', 'mobno': '5678', 'unread': '1'},
    {'name': 'Raman', 'mobno': '9012', 'unread': '6'},
    {'name': 'Rakesh', 'mobno': '3456', 'unread': '4'},
    {'name': 'Rajesh', 'mobno': '7890', 'unread': '2'},
    {'name': 'Rajat', 'mobno': '4534', 'unread': '8'},
    {'name': 'Rajendra', 'mobno': '5678', 'unread': '7'},
    {'name': 'Ram', 'mobno': '8967', 'unread': '9'},
    {'name': 'Rehman', 'mobno': '4512', 'unread': '5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 3', gitLink: gitLinks["app03c"].toString(),),
      body: ListView(
        ///////////////// Mapping single array in listview
        // children: arrNames.map((value) {
        //   return Padding( padding: const EdgeInsets.all(10),
        //     child: InkWell(
        //       onTap: (){
        //         Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthScreen()));
        //       },
        //       child: Container( width: double.infinity, height: 100,
        //         decoration: BoxDecoration( color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        //         child: Center(child: Text(value, style: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.pink, shadows: [BoxShadow(color: Colors.black, spreadRadius: 3, blurStyle: BlurStyle.outer, blurRadius: 2)]),)),
        //       ),
        //     ),
        //   );
        // }).toList()

        ///////////////// Mapping multiple arrays in listview
        children: arrData.map((value) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: const Icon(Icons.account_circle, size: 50),

                  title: Text(
                    value['name'].toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.pink,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),

                  subtitle: Text(
                    value['mobno'].toString(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),

                  trailing: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 15,
                    child: Text(
                      value['unread'].toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 3,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
