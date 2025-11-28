import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import '../app03/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

// 4th
class _FirstScreenState extends State<FirstScreen> {
  var namesLB = [
    'Listview.builder (RecyclerView of Flutter)',
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
  var namesLS = [
    'ListView.separated',
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
  var namesLT = [
    'ListTile',
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
      appBar: CustomAppBar(title: 'Part 1', gitLink: gitLinks["app03a"].toString(),),
      body:
          ///////////////////////////////// Manually Filled Listview /////////////////////////////////
          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   // reverse: true,  // makes the list reverse
          //   children: [
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Manually', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.cyan),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Filled', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.orange),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Listview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.pinkAccent),),
          //     ),
          //
          //     Padding(  padding: const EdgeInsets.all(10),
          //       child: InkWell(
          //         onTap: (){
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
          //         },
          //         child: const Text('Next Screen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.green),)),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Text Item 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.purple),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Text Item 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.black),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Text Item 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.yellow),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Text Item 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.orangeAccent),),
          //     ),
          //
          //     const Padding(  padding: EdgeInsets.all(10),
          //       child: Text('Text Item 5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.lime),),
          //     ),
          //   ],
          // )
          ///////////////////////////////// Listview.builder (RecyclerView of Flutter) /////////////////////////////////
          // ListView.builder(itemBuilder: (context, index){
          //   return InkWell(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(10),
          //       child: Text(namesLB[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.cyan),),
          //     ),
          //   );
          // },
          //   itemExtent: 100,  // increases height
          //   itemCount: namesLB.length,
          //   scrollDirection: Axis.vertical,
          // )
          /////////////////////////////// ListView.separated /////////////////////////////////
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, bottom: 15),
          //   child: ListView.separated(itemBuilder: (context, index){
          //   return InkWell(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
          //     },
          //     child: Row(
          //       children: [
          //         Padding(  padding: const EdgeInsets.only(left: 20, right: 20),
          //           child: Image.asset('res/img/clock.png', height: 40, width: 40,),
          //         ),
          //         Text(namesLS[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.cyan),),
          //           ],
          //         ),
          //   );
          //      },
          //       itemCount: namesLS.length,
          //       scrollDirection: Axis.vertical,
          //       separatorBuilder: (BuildContext context, int index) {
          //       return const Divider(height: 30, color: Colors.orange, thickness: 5,);
          //     },
          //   ),
          // )
          ///////////////////////////////// ListTile /////////////////////////////////
          ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.yellowAccent,
                  child: ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(
                      namesLT[index],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.cyan,
                      ),
                    ),
                    subtitle: Text(
                      type[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.amber,
                        shadows: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 4,
                            spreadRadius: 4,
                            blurStyle: BlurStyle.outer,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.access_time_sharp),
                    dense: true,
                  ),
                ),
              );
            },
            padding: EdgeInsets.all(20.0),
            itemCount: namesLT.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 15,
                color: Colors.pink,
                thickness: 5,
              );
            },
          ),
    );
  }
}
