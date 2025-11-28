import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: gitLinks["app11a"].toString(),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Part 1 : url_launcher",
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
            // Website Opening
            ElevatedButton(
              onPressed: () async {
                // On PC - Opens website in default browser set by user
                // On Android - Opens website within app
                if (await launchUrl(Uri.parse('https://flutter.dev'))) {
                  // Instead of using Uri.parse('https://flutter.dev'), Uri.https('flutter.dev') can also be used.
                  debugPrint("Launch Successfull");
                } else {
                  debugPrint("Launch Failed! Error occurred");
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
                "Flutter Website",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // On PC - Opens website in default browser set by user
                // On Android - Opens website using external app like Chrome
                if (await launchUrl(
                  Uri.parse('https://pub.dev'),
                  mode: LaunchMode.externalApplication,
                )) {
                  debugPrint("Launch Successfull");
                } else {
                  debugPrint("Launch Failed! Error occurred");
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
                "Pub dev Website",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            // Sending Email
            ElevatedButton(
              onPressed: () async {
                // Sends Email
                String emailReceiver = "kks12skk21@gmail.com";
                String emailSubject = "Email Sending Flutter App";
                String body = "Email Sending Flutter App is working perfectly";
                String query =
                    '''mailto:$emailReceiver?
                    &subject=${Uri.encodeComponent(emailSubject)}
                    &body=${Uri.encodeComponent(body)}''';

                // Alternate way of making query
                // String query = "mailto:kks12skk21@gmail.com?subject=Email Sending Flutter App &body=Email Sending Flutter App is working perfectly";

                if (await canLaunchUrl(Uri.parse(query))) {
                  await launchUrl(Uri.parse(query));
                } else {
                  debugPrint("Failed! Error occurred");
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
                "Send Email",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            // Calling a number
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = "tel:1234567890";
                if (await canLaunchUrl(Uri.parse(phoneNumber))) {
                  await launchUrl(Uri.parse(phoneNumber));
                } else {
                  debugPrint("Failed to call");
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
                "Call 1234567890",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            // Sending sms [Whatsapp or Messaging]
            ElevatedButton(
              onPressed: () async {
                // Sending sms
                String phoneNumber = "sms:1234567890";
                if (await canLaunchUrl(Uri.parse(phoneNumber))) {
                  await launchUrl(Uri.parse(phoneNumber));
                } else {
                  debugPrint("Failed to send sms");
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
                "Send SMS",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Secondscreen()),
                );
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
                "Next Screen",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
