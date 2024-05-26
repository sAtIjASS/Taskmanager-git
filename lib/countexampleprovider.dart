import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
void main()
{
  runApp(
     countprovider(),
  );
}
class countprovider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create:(_)=>providers(),
      child:MaterialApp(
        home: me(),
      ),
    );

  }
}


class me extends StatefulWidget{
  @override
  State<me> createState() => _meState();
}

class _meState extends State<me> {
  @override
  Widget build(BuildContext context) {
    final value=Provider.of<providers>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Count Provider"),),
      body:Center(
        child: Consumer<providers>(
          builder: (context,value,child){
            return Text("${value.count.toString()}",style: TextStyle(fontSize: 30),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
            value.setter();
        } ,
        child: Icon(Icons.add),
      ),
    );
  }
}



class providers with ChangeNotifier{
int count=0;
void getter(int value){
  count=value;
}
void setter()
{
  count++;
  notifyListeners();
}
}