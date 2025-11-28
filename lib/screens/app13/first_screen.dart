import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// Works perfectly on (Android 14, 12, 10)
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _requestPermissionAndPickImage() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      // Android
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        // Android 12 and below
        status = await Permission.storage.request();
      } else {
        // Android 13 and above
        status = await Permission.photos.request();
      }
    } else {
      // iOS
      // When the app is run, iOS will display a system dialog requesting access to the photo library. If the user denies access, they need to enable it manually in the device settings.
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      _pickImage();
    } else if (status.isPermanentlyDenied) {
      // Executed when the permission is denied twice in a row.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission denied permanently.'),
          action: SnackBarAction(
            label: "Open Settings",
            onPressed: openAppSettings,
          ),
        ),
      );
    } else {
      // Executed when the permission is denied for the first time..
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission denied. Cannot access the gallery.'),
        ),
      );
    }
  }

  // A function to pick an image from the device's gallery.
  Future<void> _pickImage() async {
    // Use `_picker` (an instance of ImagePicker) to open the gallery and allow the user to select an image.
    // If the user selects an image, the pickedFile object will contain the selected file's details (XFile).
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    // Check if the user has selected a file (i.e., `pickedFile` is not null).
    if (pickedFile != null) {
      // Update the state of the widget to store the selected image file.
      setState(() {
        // Convert the selected file path (from `pickedFile`) into a File object and assign it to `_imageFile`.
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Pick and Display Image", gitLink: ''),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            _imageFile != null
                ? Container(
                    // When _imageFile is not null. It is displayed in a square.
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      border: .all(color: Colors.grey),
                      borderRadius: .circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: .circular(8),
                      child: Image.file(_imageFile!, fit: BoxFit.cover),
                    ),
                  )
                :
                  // When _imageFile is null. A icon is displayed in a square.
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey[700],
                    ),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestPermissionAndPickImage,
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
