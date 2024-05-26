import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main()
{
  runApp(app());
}
class app extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    
    
    return MaterialApp(
      home: Scaffold(
        body: MasonryGridView.builder(gridDelegate:SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.lightBlueAccent,
            height: 200,
            width: 200,
            child: Image.network("https://uae.microless.com/cdn/no_image.jpg"),
          ),
        ))
      ),
    );
  }
}