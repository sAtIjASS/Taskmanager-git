import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderExampleTheme());
}

class ProviderExampleTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeNotifier.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: ChangeThemePage(),
          );
        },
      ),
    );
  }
}

class ChangeThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeNotifier>().toggleTheme();
          },
          child: Text("Change Theme"),
        ),
      ),
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
