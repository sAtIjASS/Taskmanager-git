import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Provider with list in flutter and create the dynamic List in the ListProviderApp in Provider class
void main() {
  runApp(
    ListProviderApp(),
  );
}

TextEditingController textEditingController = TextEditingController();

class ListProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListPro(),
      child: MaterialApp(
        home: LP(),
      ),
    );
  }
}

class LP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setWorking = Provider.of<ListPro>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setWorking.setValueToList(textEditingController.text.toString());
                textEditingController.clear();
              },
              child: Text("Add"),
            ),
            Consumer<ListPro>(
              builder: (context, value, child) {
                return Container(
                  height: 300, // Set a fixed height for the ListView
                  child: ListView.builder(
                    itemCount: value.satija.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${value.satija[index]}",
                        style: TextStyle(
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListPro with ChangeNotifier {
  List<String> _satija = [];

  List<String> get satija => _satija;

  void setValueToList(String value) {
    _satija.add(value);
    notifyListeners(); // Notify listeners about the change
  }
}
