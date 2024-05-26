import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf_p/counterbloc1.dart';
import 'counter_bloc.dart'; // Make sure to import the correct files
import 'counterstate1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (_) => counterbloc(), // Ensure the correct Bloc class is used
      child: MaterialApp(
        home: MyAppState(),
      ),

    );
  }
}

class MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My BLOC App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<counterbloc, counterstate>(builder: (context, state) {
              // Ensure correct types are used for Bloc and State
              print("build");
              return Text(

                state.counter.toString(),
                style: TextStyle(fontSize: 20),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<counterbloc>().add(incerementcounter());
                    // Ensure correct event types are dispatched
                  },
                  child: const Text("+", style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    context.read<counterbloc>().add(Decerementcounter());
                    // Ensure correct event types are dispatched
                  },
                  child: const Text("-", style: TextStyle(fontSize: 20)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
