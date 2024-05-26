import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'apiwork1.dart';

List<Apivalue> apivalue = [];
RxList <dynamic> data=[].obs;
void main() {
  runApp(GetMaterialApp( debugShowCheckedModeBanner : false,home: apiwork()));
}

class apiwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Api Data"),
       centerTitle: true,
       backgroundColor: Colors.cyan,
     ),
      body: FutureBuilder(
        future: getdataapi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder( itemCount : apivalue.length,itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      )
                    ]
                  ),
                  child: SingleChildScrollView(

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id :- ${apivalue[index].id}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Name :- ${apivalue[index].name} ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Email :-  ${apivalue[index].username}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Phone :-  ${apivalue[index].phone}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Website :-  ${apivalue[index].website}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Company Related Information ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Company :-  ${apivalue[index].company.name}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text(
                              "CatchPhrase :- ${apivalue[index].company.catchPhrase}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Bs :-  ${apivalue[index].company.bs}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Address Related Information ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Street :-  ${apivalue[index].address.street}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Suite :-  ${apivalue[index].address.suite}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("City :-  ${apivalue[index].address.city}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Zipcode :-  ${apivalue[index].address.zipcode}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Geo Related Information ",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Lat :-  ${apivalue[index].address.geo.lat}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          Text("Lng :-  ${apivalue[index].address.geo.lng}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                          SizedBox(height: 20,),


                          ElevatedButton(onPressed: (){
                           data.add(
                             {
                               "id":apivalue[index].id,
                               "name":apivalue[index].name,
                               "username":apivalue[index].username,
                               "email":apivalue[index].email,
                               "phone":apivalue[index].phone,
                               "website":apivalue[index].website,
                               "company":apivalue[index].company.name,
                               "catchPhrase":apivalue[index].company.catchPhrase,
                               "bs":apivalue[index].company.bs,
                               "street":apivalue[index].address.street,
                               "suite":apivalue[index].address.suite,
                               "city":apivalue[index].address.city,
                               "zipcode":apivalue[index].address.zipcode,
                               "lat":apivalue[index].address.geo.lat,
                               "lng":apivalue[index].address.geo.lng

                             }
                           )  ;


                           //Now this is the Map which contain Our related data

                            //Now I use the Navigator class to send the data in sort class

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>sortmethod(
                              key:GlobalKey(), datas:data
                            )));

                          }, child: Text("list",style: TextStyle(fontSize: 14)),),


                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Apivalue>> getdataapi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final save = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in save) {
        apivalue.add(Apivalue.fromJson(index));
      }
      return apivalue;
    } else {
      return apivalue; //If the data is null so it return null value
    }
  }
}




//This is the another class to fetch the data from the api and sort that data

class sortmethod extends StatelessWidget {
    RxList <dynamic> datas=[].obs;
   sortmethod({Key? key, required this.datas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Data"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
      body:ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Container(
              width: 500,
              height: 500,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){
                              datas.sort((a,b){
                                return a["id"].CompareTo(b["id"]);
                              });
                              Get.forceAppUpdate();
                            }, child: Text("Aes sort",style: TextStyle(fontSize: 14),),),
                            ElevatedButton(onPressed: (){
                              datas.sort((a,b){
                                return
                                    int .parse(a["id"]).compareTo(int.parse(b["id"]));
                              });
                              Get.forceAppUpdate();
                  
                            }, child: Text("Des sort",style: TextStyle(fontSize: 14),),),
                          ],
                        ),
                        Text("ID :-  ${datas[index]["id"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Name :-  ${datas[index]["name"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Username :-  ${datas[index]["username"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Email :-  ${datas[index]["email"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Phone :-  ${datas[index]["phone"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Website :-  ${datas[index]["website"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Company :-  ${datas[index]["company"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("CatchPhrase :-  ${datas[index]["catchPhrase"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Bs :-  ${datas[index]["bs"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Street :-  ${datas[index]["street"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Lng :-  ${datas[index]["lng"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("lat :-  ${datas[index]["lat"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Suite :-  ${datas[index]["suite"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("City :-  ${datas[index]["city"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        Text("Zipcode :-  ${datas[index]["zipcode"]}",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 12),),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){
                          datas.removeAt(index);
                          Get.forceAppUpdate();
                        }, child: Text("Remove",style: TextStyle(fontSize: 12)))
                        ]
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}