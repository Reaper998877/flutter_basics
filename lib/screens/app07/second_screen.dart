import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:intl/intl.dart'; // new import added + new dependency added in pubspec.yaml

class SecondScreen extends StatefulWidget {
  final String data;

  const SecondScreen(this.data, {super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var c = 0;
  var controlno1 = TextEditingController();
  var controlno2 = TextEditingController();
  var result = "";

  var time = DateTime.now();
  var tptime = "";

  void getResult(String operator) {
    var no1 = int.parse(controlno1.text.toString().trim());
    var no2 = int.parse(controlno2.text.toString().trim());

    if (operator == "Add") {
      setState(() {
        result = "Result is : $no1 + $no2 = ${no1 + no2}";
      });
    } else if (operator == "Subtract") {
      setState(() {
        result = "Result is : $no1 - $no2 = ${no1 - no2}";
      });
    } else if (operator == "Divide") {
      setState(() {
        var d = no1 / no2;
        result =
            "Result is : $no1 / $no2 = ${d.toStringAsFixed(2)}"; // only 2 digit after decimal
      });
    } else {
      setState(() {
        var d = no1 * no2;
        result =
            "Result is : $no1 * $no2 = ${d.toStringAsFixed(2)}"; // only 2 digit after decimal
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: '',),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Part 2 : Widgets => StatefulWidget and StatelessWidget,  Date and Time',
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
            
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Sent Data : ${widget.data}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
            
                /////////////////////////////// StatefulWidget and StatelessWidget ///////////////////////////////
                ///////// Count Increment Code
                Text(
                  'Count: $c',
                  style: const TextStyle(fontSize: 30, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text(
                      'Increment Count',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
            
                ///////// Simple Calculator Code
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: controlno1,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      labelText: "Num1",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: controlno2,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      labelText: "Num2",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        getResult("Add");
                      },
                    ),
            
                    IconButton(
                      icon: const Icon(Icons.minimize),
                      onPressed: () {
                        getResult("Subtract");
                      },
                    ),
            
                    ElevatedButton(
                      child: const Text('Divide'),
                      onPressed: () {
                        getResult("Divide");
                      },
                    ),
            
                    ElevatedButton(
                      child: const Text('Multiply'),
                      onPressed: () {
                        getResult("Multiply");
                      },
                    ),
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    result,
                    style: const TextStyle(color: Colors.black, fontSize: 35),
                  ),
                ),
            
                /////////////////////////////// Date and Time ///////////////////////////////
                /////////////  Normal Date & Time ( Number Format )  /////////////
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Normal Date & Time ( Number Format )',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan,
                    ),
                  ),
                ),
            
                Text(
                  'Current Time : ${time.hour} hr - ${time.minute} min - ${time.second} sec ',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Current Date : ${time.year} yr - ${time.month} mon - ${time.weekday} day - ${time.day} date',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                  ),
                ),
            
                /////////////  Formatted Date & Time  /////////////
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Formatted Date & Time',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan,
                    ),
                  ),
                ),
            
                // Text('Current Time : ${DateFormat('Hms').format(time)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.red),),
                Text(
                  'Current Time : ${DateFormat('jms').format(time)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Current Date: ${DateFormat('yMd').format(time)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  'Current Date: ${DateFormat('yMMMMd').format(time)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                  ),
                ),
                // Text('Current Date: ${DateFormat('yMMMM').format(time)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.purple),),
                Text(
                  'Current Date: ${DateFormat('yMMMMEEEEd').format(time)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                  ),
                ),
                // Text('Current Day: ${DateFormat('EEEE').format(time)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.amber),),
                // Text('Current Month : ${DateFormat('MMMM').format(time)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.pinkAccent),),
                Text(
                  'Current Date and Time : ${DateFormat('yMMMMd').format(time)} ${DateFormat('jms').format(time)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueAccent,
                  ),
                ),
            
                /////////////  Date & Time Picker  /////////////
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Date & Time Picker',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan,
                    ),
                  ),
                ),
            
                ElevatedButton(
                  child: const Text(
                    'Set Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () async {
                    DateTime? datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );
            
                    if (datePicked != null) {
                      debugPrint(
                        'Date selected: ${DateFormat('yMMMMEEEEd').format(datePicked)}',
                      );
                    } else {
                      debugPrint(
                        'Date selected: ${DateFormat('yMMMMEEEEd').format(time)}',
                      );
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text(
                    'Set Time',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
            
                    if (pickedTime != null) {
                      getTime(pickedTime);
                    } else {
                      TimeOfDay time = TimeOfDay.now();
                      getTime(time);
                    }
                  },
                ),
                Text(
                  tptime,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getTime(TimeOfDay pickedTime) {
    if (pickedTime.hour > 12) {
      // 1 pm to 11.59 pm
      debugPrint(
        'Time selected: ${pickedTime.hour - 12} : ${pickedTime.minute} PM',
      );
      setState(() {
        tptime =
            'Time selected: ${pickedTime.hour - 12} : ${pickedTime.minute} PM';
      });
    } else if (pickedTime.hour == 12 && pickedTime.period == DayPeriod.pm) {
      // 12 pm to 12.59 pm
      //  pickedTime.period gives either DayPeriod.pm or DayPeriod.am
      debugPrint('Time selected: ${pickedTime.hour} : ${pickedTime.minute} PM');
      setState(() {
        tptime = 'Time selected: ${pickedTime.hour} : ${pickedTime.minute} PM';
      });
    } else if (pickedTime.hour == 0) {
      // 12 am to 12.59 am
      debugPrint('Time selected: 12 : ${pickedTime.minute} AM');
      setState(() {
        tptime = 'Time selected: 12 : ${pickedTime.minute} AM';
      });
    } else {
      // 1 am to 11.59 am
      debugPrint('Time selected: ${pickedTime.hour} : ${pickedTime.minute} AM');
      setState(() {
        tptime = 'Time selected: ${pickedTime.hour} : ${pickedTime.minute} AM';
      });
    }
  }
}
