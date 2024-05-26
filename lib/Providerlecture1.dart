import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sf_p/Providerlecture2.dart';
import 'package:sf_p/gridviewextent.dart';
void main()
{
  runApp(
    providerexample(),
  );
}
double value=0.0;
class providerexample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create:(_)=>proslider(),),
        ChangeNotifierProvider(create:(_)=>proslider(),)

      ],
      child: MaterialApp(
        home: pex(),
      ),
    );
  }
}
class pex extends StatefulWidget{
  @override
  State<pex> createState() => _pexState();
}

class _pexState extends State<pex> {
  @override
  Widget build(BuildContext context) {
    final setvalue =Provider.of<proslider>(context,listen: false);
    return Scaffold(

      body: Column(
        children: [
Consumer<proslider>(builder: (context,value,child){
  return           Slider(
      min: 0,
      max: 1.0,
      value:setvalue.get() , onChanged: (val){
    setvalue.setvalues(val);
  });
})

        ,
        Row(
          children: [
            Expanded(
              child: Consumer<proslider>(
                builder: (context,value,child){
                  return
                    Container(
                      height: 200,
                      decoration: BoxDecoration(color: Colors.green.withOpacity(value.get())),
                      child: Text("Container 1"),
                    );
                }
              )
            ),
            Expanded(

              child: Consumer<proslider>(
                builder: (context,value,child){
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(color: Colors.yellow.withOpacity(value.get())),
                    child: Text("Container 1"),
                  );
                }
              )
            )
          ]
        )],
      ),
    );
  }
}

//Provider Class
class proslider with ChangeNotifier {
  double _value = 1.0;
  double get() => _value;
   void setvalues(val)
   {
     _value=val;
     notifyListeners();
   }


}