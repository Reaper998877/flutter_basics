import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var userName = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: gitLinks["app04a"].toString(),),
      ////////////////////// SingleChildScrollView ( Vertical ) //////////////////////
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Part 1 : Widgets => SingleChildScrollView [V and H],    TextField,    Stack,    Positioned,    ConstrainedBox',
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

              ////////////////////// SingleChildScrollView ( Horizontal ) //////////////////////
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.orange,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 1',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.indigo,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 2',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.pink,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 3',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.green,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 4',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.amber,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 5',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.purple,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          'Item 6',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ////////////////////// TextField //////////////////////
              SizedBox(height: 20.0,),
              TextField(
                textAlign: TextAlign.start,
                autocorrect: true,
                style: AppTheme.textStyle1,
                controller: userName,
              
                // to customize cursor
                cursorHeight: 5,
                cursorWidth: 5,
                cursorRadius: const Radius.circular(5),
                cursorColor: Colors.purple,
              
                // showCursor: false,  // hides cursor
              
                // readOnly: true,  // won't allow to type
              
                // textCapitalization: TextCapitalization.characters,  // turn on caps lock
                keyboardType: TextInputType.emailAddress,
              
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  focusedBorder: OutlineInputBorder(
                    ///////////////////  Normal Border  ///////////////////
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                      width: 3,
                    ),
                  ),
              
                  enabledBorder: OutlineInputBorder(
                    /////////////////// enabledBorder ///////////////////
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green, width: 3),
                  ),
              
                  label: Text("Username"),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                textAlign: TextAlign.start,
                cursorColor: Colors.red,
                autocorrect: true,
                style: AppTheme.textStyle1,

                // enabled: false,  // won't allow to type
                controller: password,
                keyboardType: TextInputType.text,

                obscureText:
                    true, // input will be displayed as given character here => *

                obscuringCharacter: "*",

                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  hintText: "Password",

                  hintStyle: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),

                  focusedBorder: OutlineInputBorder(
                    /////////////////// focusedBorder ///////////////////
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.deepOrange, width: 3),
                  ),

                  enabledBorder: OutlineInputBorder(
                    /////////////////// enabledBorder ///////////////////
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green, width: 3),
                  ),

                  // disabledBorder can be seen when => enabled: false,
                  disabledBorder: OutlineInputBorder(
                    /////////////////// disabledBorder ///////////////////
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),

                  // suffixText: "Decorated Border S",  // suffixText is same as hint or placeholder but at right side
                  //
                  // suffixStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.cyan),

                  // prefixText: "Decorated Border P",  // prefixText is same as hint or placeholder but at left side
                  //
                  // prefixStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.deepPurple),
                  suffixIcon: IconButton(
                    // icon at right side
                    icon: Icon(Icons.remove_red_eye, color: Colors.black),
                    onPressed: () {
                      debugPrint('Pressed suffix IconButton');
                    },
                  ),

                  // prefixIcon: IconButton(  // icon at left side
                  //   icon: Icon(Icons.access_alarm_rounded, color: Colors.deepPurpleAccent,),
                  //   onPressed: (){
                  //     debugPrint('Pressed prefix IconButton');
                  //   },
                  // ),
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: const Text("debugPrint"),
                onPressed: () {
                  String userNamevalue = userName.text.toString().trim();
                  String passwordvalue = password.text.toString().trim();
                  debugPrint(
                    "Username: $userNamevalue, Password: $passwordvalue",
                  );
                },
              ),
              SizedBox(height: 20.0,),
              ////////////////////// Stack, Positioned //////////////////////
              /////// Overlap Stack
              Stack(
                children: [
                  Container(
                    color: Colors.amber,
                    height: 300,
                    width: 300,
                    child: const Text(
                      'First Written',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ), // Bottom of Stack
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      color: Colors.red,
                      height: 250,
                      width: 250,
                      child: const Text(
                        'Second Written',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ), // Middle of Stack
                  Positioned(
                    top: 60,
                    left: 60,
                    child: Container(
                      color: Colors.purple,
                      height: 200,
                      width: 200,
                      child: const Text(
                        'Third Written',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ), // Top of Stack
                ],
              ),

              /////// Overlay Stack
              Container(
                width: 240,
                height: 240,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 200,
                      width: 200,
                      child: const Text(
                        'First Written',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        color: Colors.purple,
                        height: 200,
                        width: 200,
                        child: const Text(
                          'Second Written',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ////////////////////// ConstrainedBox //////////////////////
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 200,
                  ),
                  child: const Text(
                    'SingleChildScrollView, TextField, Stack, Positioned, ConstrainedBox All in one Flutter Application',
                    style: TextStyle(fontSize: 40, color: Colors.red),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  minWidth: 200,
                  maxHeight: 400,
                  minHeight: 100,
                ),
                child: ElevatedButton(
                  child: const Text(
                    'Next Screen',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
