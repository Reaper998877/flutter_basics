import 'package:flutter/material.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.path});

  final String path;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var lastnameCode = TextEditingController(),
      familyCode = TextEditingController(),
      cFamilyCode = TextEditingController();

  final _formKey =
      GlobalKey<
        FormState
      >(); // In Dart, variables that are prefixed with an underscore (_) are private.
  late String lastname, password, cPassword, selectedAA;
  bool hidePassword = true, hideConPassword = true;
  String text = "This is a dialog widget";
  List<String> availabilityList = ['Mon - Fri', 'Sat - Sun', 'Always', 'Other'];

  @override
  void initState() {
    super.initState();
    selectedAA = availabilityList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: '',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Part 2 : Widgets => Form Widget,    Dialog,    StatefulBuilder,    Custom_GradientButton,    DropdownButton,    DropdownButtonHideUnderline,',
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
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      enableInteractiveSelection: false,
                      cursorHeight: 35,
                      cursorWidth: 3,
                      cursorRadius: const Radius.circular(5),
                      cursorColor: Colors.blue.shade900,
                      keyboardType: TextInputType.name,
                      controller: lastnameCode,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Your Lastname",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFF3700B3),
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Lastname';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      enableInteractiveSelection: false,
                      cursorHeight: 35,
                      cursorWidth: 3,
                      cursorRadius: const Radius.circular(5),
                      cursorColor: Colors.blue.shade900,
                      keyboardType: TextInputType.number,
                      controller: familyCode,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                      obscureText: hidePassword,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Your Family Code (Min 4 Digits)",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword =
                                  !hidePassword; // here new value is given to hidePassword
                              // !hidePassword means Logical NOT operator [ !F = T, !T = F] is used on value of hidePassword, which is not null
                            });
                          },
                          child: Icon(
                            size: 28,
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          ///////////////////  When Typing  ///////////////////
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFF3700B3),
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          /////////////////// When Not Typing ///////////////////
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Family Code';
                        } // add other validations
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        child: const Text(
                          "Add",
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // _formKey.currentState is used to access the current state of the form
                            // ! operator assures that _formKey.currentState will never be null
                            // If _formKey.currentState is null then validate() method is not called and will throw a runtime error, causing your app to crash.
                            // If _formKey.currentState is not null then validate() method is called on the form's current state. It checks all the form fields for validation according to the validators you've set up for each field. If all fields are valid, it returns true; otherwise, it returns false.
                            lastname = lastnameCode.text.toString().trim();
                            password = familyCode.text.toString().trim();
                            debugPrint(
                              'Lastname: $lastname, Password: $password',
                            );
                            debugPrint(_formKey.currentState.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThirdScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: SizedBox(
                          width: 500.0,
                          height: 300.0,
                          child: Center(
                            child: StatefulBuilder(
                              builder:
                                  (
                                    BuildContext context,
                                    void Function(void Function()) setState,
                                  ) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          text,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 25,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              text =
                                                  "This is inside StatefulBuilder widget";
                                            });
                                          },
                                          child: const Text(
                                            "Change Text",
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Show Dialog"),
              ),
              const SizedBox(height: 20),
              CustomGradientButton(
                text: "Gradient Button",
                onPressed: () {
                  debugPrint("Clicked on Gradient Button");
                },
                gradient: AppTheme.gradient1(),
                borderColor: Colors.grey,
                opacity: 1.0,
              ),
              const SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff797979),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: selectedAA,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 40,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAA = newValue!;
                      });
                    },
                    items: availabilityList
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTheme.inputTextStyle1(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
