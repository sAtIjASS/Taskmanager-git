import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Rx<XFile>? _selectedImage = Rx<XFile>(XFile(''));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, World!'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text('Pick an Image'),
              ),
              SizedBox(height: 20),

              // Use ternary operator or a function to conditionally display the widget
              _selectedImage?.value != null
                  ? Obx(
                    ()=> CircleAvatar(
                  radius: 80,
                  child: Text("Select Image"),
                  backgroundImage:
                  FileImage(File(_selectedImage!.value!.path)),
                ),
              )

                  : Text('No image selected'),
            ],
          ),
        ),
      ),
    );
  }

  void uploadImage() async {
    XFile? selectedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
      // Assign directly to _selectedImage.value
      _selectedImage!.value = selectedImage;
    }
  }
}
