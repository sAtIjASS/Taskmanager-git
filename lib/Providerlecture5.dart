import'package:flutter/material.dart';
import'package:provider/provider.dart';
import 'package:sf_p/gridviewextent.dart';
void main()
{
  runApp(
    providerexamplelist(),
  );
}
class providerexamplelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>setpro(),
      child: MaterialApp(
        home: mainclass(),
      ),);
  }
}
class mainclass extends StatelessWidget{
  TextEditingController con=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final setvalue =Provider.of<setpro>(context,listen: false);
    return MaterialApp(

      home: Scaffold(
          body:SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller:con,
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(onPressed: (){
                    setvalue.setvalueinlist(con.text.toString());
                    con.clear();
                  }, child: Text("Add")),
                  SizedBox(height: 12,),
                  Consumer<setpro>(builder: (context,value,child){
                    return
                      SingleChildScrollView(
                        child: Container(
                            height: 500,
                            child:ListView.builder(itemBuilder: (context,index){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${value.valueinlist[index]}"),
                                  Icon(Icons.favorite,color: Colors.red,),
                                ],
                              );
                            },itemCount:value.valueinlist.length ,)
                        ),
                      );
                  })
                ],
              ),
            ),
          )
      ),
    );
  }
}






//It is the Class of Provider

class setpro with ChangeNotifier{
  List<dynamic> valueinlist=[];
  void setvalueinlist(String val){
    valueinlist.add(val);
    notifyListeners();
  }
}
