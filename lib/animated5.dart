import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  State<myapp> createState() => myapps();
}

class myapps extends State<myapp> {
  Widget build(BuildContext context) {
    List<String> setinitialslist = ["A", "B", "C"];
    final GlobalKey<AnimatedListState> listvalue = GlobalKey();
    return GetMaterialApp(
      home: Scaffold(
        body: AnimatedList(
          key: listvalue,
          initialItemCount: setinitialslist.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(
                setinitialslist[index], animation, index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            add(setinitialslist, listvalue);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildItem(String items, Animation<double> animation, int index) {
    return SlideTransition(
      position: animation
          .drive(Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0),)),
      child: ListTile(
        title: Text(items),
        onTap: () {

        },
      ),
    );
  }

  void add(List<String> setinitialslist,
      GlobalKey<AnimatedListState> listvalue) {
    {
      final int newvalue = setinitialslist.length;
      setinitialslist.add("items${newvalue + 1}");
      listvalue.currentState!.insertItem(newvalue);
    }
  }
}
