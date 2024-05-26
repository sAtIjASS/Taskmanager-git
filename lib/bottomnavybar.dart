import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  State<MyApp> createState()=>bottomnavybar();
  const MyApp({Key? key}) : super(key: key);
}
class bottomnavybar extends State<MyApp>
{
  PageController setnewpage=PageController();
  int currentpage=0;
  void initState()
  {
    super.initState();
    setnewpage=PageController();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home:Scaffold(
          body:PageView(
            controller: setnewpage,
            children: <Widget>[
              Container(
                  child:  Center(
                      child:Text("Priyanshu satija",style: TextStyle(fontFamily: "Raleway",fontSize: 30,fontWeight: FontWeight.bold),)
                  )
              ),
              Container(
                  child:  Center(
                      child:Text("Mr Satija",style: TextStyle(fontFamily: "Raleway",fontSize: 30,fontWeight: FontWeight.bold),)
                  )
              ),
              Container(
                  child:  Center(
                      child:Text("Mr Priyanshu ",style: TextStyle(fontFamily: "Raleway",fontSize: 30,fontWeight: FontWeight.bold),)
                  )
              ),
              Container(
                  child:  Center(
                      child:Text("Mr Priyanshu satija",style: TextStyle(fontFamily: "Raleway",fontSize: 30,fontWeight: FontWeight.bold),)
                  )
              ),
            ],
          )   ,
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.white,
            selectedIndex: currentpage,
            curve: Curves.bounceIn,
            showElevation: true,
            mainAxisAlignment: MainAxisAlignment.center,
            onItemSelected: (index)=>setState(() {
              currentpage=index;
              setnewpage.animateToPage(index , duration: Duration(seconds: 3), curve: Curves.bounceIn);

            }),
            items: [
              BottomNavyBarItem(icon: Icon(Icons.home), title:Text("home")),
              BottomNavyBarItem(icon: Icon(Icons.abc), title:Text("home")),
              BottomNavyBarItem(icon: Icon(Icons.one_k), title:Text("home")),
              BottomNavyBarItem(icon: Icon(Icons.person), title:Text("home"))
            ],
            containerHeight: 55.0,
          ),
        )

    );
  }
  void dispose() {
    super.dispose();
    setnewpage.dispose();
  }
}