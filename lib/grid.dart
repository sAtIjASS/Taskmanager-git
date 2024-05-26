import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
void main()
{
  runApp(grid_practice());
  return ;
}
class grid_practice extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 500,
                child: GridView.count(crossAxisCount: 4,
                crossAxisSpacing: 10,mainAxisSpacing: 10,
                children: [
                  Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.pink,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.brown,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,),
                ],),
              ),


SizedBox(height: 200,),





              SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                child: Container(

                    width: 600,
                    height: 400,

                  child: GridView.extent(
                    maxCrossAxisExtent: 50, // Set the maximum extent of each item
                    crossAxisSpacing: 10, // Set the spacing between columns
                    mainAxisSpacing: 10, // Set the spacing between rows
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.black,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.pink,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              )


,
SizedBox(height: 60),
SingleChildScrollView(
  child: Container(
    width: 600,
    height: 400,
    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10,mainAxisExtent: 50,childAspectRatio: 1.0)  , itemBuilder: (context, index) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.yellow,
            ),
          ],
        ),
      );

    }),
  ),
)



            ],
          ),
        ) ,
      ),
    );
  }
}