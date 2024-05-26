import'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
 return ;
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   _MyAppState({Key? key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body:ListView(
          children: [
            ExpansionTileCard(
              title: Text("Expansion title card"),
              subtitle: Text("Expansion subtitle"),
              children: [
                Divider(
                  thickness: 4,
                  height: 1.0,
                ),
                Align(
                  alignment:Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0
                    ),
                    child: Image.asset("assets/images/name.jpg"),
                  )
                )
              ]
            )
          ],
        )
      ),
    );
  }
}
