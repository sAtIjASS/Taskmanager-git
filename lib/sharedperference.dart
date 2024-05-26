import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import'package:shared_preferences/shared_preferences.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(GetMaterialApp(home: MyApp()));
  return ;
}
class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}
RxString  show="".obs;
RxString s="".obs;
var me;

class _MyAppState extends State<MyApp> {
  @override
  TextEditingController con = new TextEditingController();
  Widget build(BuildContext context)
  {
    return  Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: con,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:Colors.blue)
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 10,
              ),
              ElevatedButton(onPressed: (){
                 sh();
              }, child: Text("Pressed")),
              SizedBox(
                height: 20,
                width: 20,
              ),

                Obx(() =>  Text("$show"),
                ),Obx(() =>  Text("$s")),

            ],
          ),
        ),
      );
  }
  void sh()async{
    final store= await SharedPreferences.getInstance();
    store.setString('name', '${con.text.toString()}');
     me =await store.get('name');
     show.value=me.toString();

     var secure=new FlutterSecureStorage();
     secure.write(key: 'name', value: '${con.text.toString()}');
     var storage= await secure.read(key: 'name').toString();
     s.value = "Priyanshu satija: " + await storage.toString();
  }
}


