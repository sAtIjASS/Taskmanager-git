import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void main() {
  runApp(SecureApps());
}

class SecureApps extends StatelessWidget {
  final storage = FlutterSecureStorage();
  TextEditingController controller1 = TextEditingController();

  SecureApps() {
    // Reading data from storage when the app starts
    readFromStorage();
  }

  void writeToStorage() {
    // Writing data to storage
    storage
        .write(key: "name", value: controller1.text.toString())
        .then((value) => print("Value is stored in secure storage"));
  }

  void  readFromStorage() {
    // Reading data from storage and updating the controller
    storage.read(key: "name").then((value) {
      if (value != null) {
        controller1.text = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                controller: controller1,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Calling the method to write to storage
                  writeToStorage();
                },
                child: Text("PRESSED"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Calling the method to read from storage
                  readFromStorage();
                },
                child: Text("Fetch Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
