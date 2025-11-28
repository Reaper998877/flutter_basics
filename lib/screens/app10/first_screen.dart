import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// No changes in Info.plist

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isConnectedToInternet =
      false; // Internet is connected (true) or not (false).
  StreamSubscription? _internetConnectionStreamSubscription;

  // Note - When you are working with streams in flutter, it is important that you dispose of them properly, to avoid memory leaks.

  @override
  void initState() {
    super.initState();
    // InternetConnection().onStatusChange.listen - Used to get the internet status change
    // when internet is off status = InternetStatus.disconnected
    // when internet is on status = InternetStatus.connected
    // It detects both mobile data as well as wifi.
    // _internetConnectionStreamSubscription = InternetConnection().onStatusChange.listen because the listen method returns a StreamSubscription
    _internetConnectionStreamSubscription = InternetConnection().onStatusChange
        .listen((event) {
          debugPrint(event.toString());
          switch (event) {
            case InternetStatus.connected:
              setState(() {
                isConnectedToInternet = true;
              });
              break;
            case InternetStatus.disconnected:
              setState(() {
                isConnectedToInternet = false;
              });
              break;
          }
        });
  }

  // The dispose method is called when the widget (Widget build...) gets disposed.
  @override
  void dispose() {
    // Disposing the stream
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Internet Checker",
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
            Icon(
              isConnectedToInternet ? Icons.wifi : Icons.wifi_off,
              size: 100,
              color: isConnectedToInternet ? Colors.green : Colors.red,
            ),
            Text(isConnectedToInternet ? "Connected" : "Disconnected"),
          ],
        ),
      ),
    );
  }
}
