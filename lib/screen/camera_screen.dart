import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _imagePicker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        _image = value;
        Navigator.pop(context, _image);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Camera'),
        ),
        body: Center(
          child: _image == null
              ? const Text('No image selected.')
              : Image.file(File(_image!.path)),
        ));
  }
}
