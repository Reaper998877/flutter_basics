import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:permission_handler/permission_handler.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  String statusDisplay = "Microphone Permission";
  bool hide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2', gitLink: '',),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // For android permission added in manifest
            // For ios, only Info.plist is edited. No need to edit Podfile
            const Text(
              "Part 2 : Microphone Permission",
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
            ElevatedButton(
              onPressed: () async {
                PermissionStatus microphoneStatus = await Permission.microphone
                    .request();
                if (microphoneStatus == PermissionStatus.granted) {
                  setState(() {
                    statusDisplay = "Microphone Permission Granted";
                    hide = true;
                  });
                }
                if (microphoneStatus == PermissionStatus.denied) {
                  setState(() {
                    statusDisplay = "Microphone Permission Denied";
                    hide = true;
                  });
                }
                if (microphoneStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings(); // Opens App Setting
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 10,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                "Give Permission",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Visibility(
              visible: hide,
              child: Text(
                statusDisplay,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
