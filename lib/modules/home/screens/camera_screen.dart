// Flutter code to open the camera automatically when entering a screen
// Assumes the use of the image_picker package

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _openCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: _imageFile == null
            ? const Text('No image captured.')
            : Image.file(
          File(_imageFile!.path),
          fit: BoxFit.cover,
        ),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomElevatedButton(onTap: (){},buttonText: 'Gallery',),
      ),
    );
  }
}
