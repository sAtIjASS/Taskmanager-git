import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(Gra());
}

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getimage satija = Get.put(getimage()); // Moved initialization here
    return GetMaterialApp(
      home: Scaffold(
        body: Obx(() => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: satija.image_path.isNotEmpty ? FileImage(File(satija.image_path.value)) : null,
                ),
              ),
              TextButton(
                onPressed: () {
                  satija.getss();
                },
                child: Text("Press"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class getimage extends GetxController {
  RxString image_path = "".obs;

  Future<void> getss() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      image_path.value = image.path;
    }
  }
}
