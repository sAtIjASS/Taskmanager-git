import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedListExample(),
    );
  }
}

class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  List<String> _list = ['Item 1', 'Item 2', 'Item 3']; // Initial list items
  final GlobalKey<AnimatedListState> _listKey = GlobalKey(); // GlobalKey for AnimatedList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List Example'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_list[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem(); // Add an item to the list
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SlideTransition(
      position: animation.drive(Tween<Offset>(
        begin: Offset(-1, 0), // Start position
        end: Offset(0, 0),    // End position
      )),
      child: ListTile(
        title: Text(item),
        onTap: () {
          _removeItem(index); // Remove item from the list when tapped
        },
      ),
    );
  }

  void _addItem() {
    final int newIndex = _list.length;
    _list.add('Item ${newIndex + 1}');
    _listKey.currentState!.insertItem(newIndex); // Insert new item with animation
  }

  void _removeItem(int index) {
    final removedItem = _list.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
          (context, animation) => _buildItem(removedItem, animation, index),
    ); // Remove item with animation
  }
}
