import'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import'package:provider/provider.dart';
void main()
{
  runApp(
    countsss(),
  );
}

class countsss extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>pro(),
      child: MaterialApp(
        home: countss(),
      ),
    );
  }
}
class countss extends StatefulWidget{
  @override
  State<countss> createState() => _countssState();
}

class _countssState extends State<countss> {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final values=Provider.of<pro>(context,listen: false);
    return Scaffold(
      body:Center(
        child: Consumer<pro>(
          builder: (context,value,child){
            return Text("${values.count}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          values.increment();
        },
      ),
    );
  }
}


//Provider class
class pro with ChangeNotifier{
  int count=0;
  void increment(){
    count++;
    notifyListeners();
  }
}

