import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'Signoutscreen.dart';

final TaskController taskController = Get.put(TaskController());

// Variables to store the selected date and time in milliseconds and minutes respectively
late int storedDate = DateTime.now().millisecondsSinceEpoch;
late int storedTime = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;

TextEditingController firstController = TextEditingController();
TextEditingController secondController = TextEditingController();

class TaskScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Management',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://i.postimg.cc/66jrPTRY/photo.webp',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: firstController,
                  decoration: InputDecoration(
                    labelText: 'Enter Task',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                    hintText: 'Type your task here',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: secondController,
                  decoration: InputDecoration(
                    labelText: 'Task Description',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                    hintText: 'Type your task description here',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DateTimePickerDialog();
                      }));
                    },
                    child: Text("Set Date and Time", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      taskController.addTask(firstController.text, secondController.text, storedDate, storedTime);
                    },
                    child: Text("Set Task", style: TextStyle(color: Colors.white)),
                  ),
                ),

                SizedBox(height: 20,),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: taskController.getTasksStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No tasks found', style: TextStyle(color: Colors.white)));
                      }
                      var tasks = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          var task = tasks[index];
                          var taskId = task.id;
                          var taskData = task.data() as Map<String, dynamic>;
                          return Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Title: ${taskData['title']}", style: TextStyle(color: Colors.black)),
                                  subtitle: Text("Description: ${taskData['description']}", style: TextStyle(color: Colors.black)),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => taskController.deleteTask(taskId),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text("Date: ${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(taskData['date'] ?? 0))}", style: TextStyle(color: Colors.black)),
                                      SizedBox(width: 20,),
                                      Text("Time: ${(taskData['time'] ?? 0) ~/ 60}:${((taskData['time'] ?? 0) % 60).toString().padLeft(2, '0')}", style: TextStyle(color: Colors.black)),
                                      SizedBox(width: 20,),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () => _showEditDialog(context, taskId, taskData),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskController extends GetxController {
  Future<void> addTask(String title, String description, int date, int time) async {
    try {
      if (title.isEmpty || description.isEmpty) {
        Get.snackbar('Error', 'Please fill in all fields');
        return;
      }
      await FirebaseFirestore.instance.collection('tasks').add({
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to add task: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task: $e');
    }
  }

  Future<void> updateTask(String taskId, String title, String description, int date, int time) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
        'title': title,
        'description': description,
        'date': date,
        'time': time,
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task: $e');
    }
  }

  Stream<QuerySnapshot> getTasksStream() {
    return FirebaseFirestore.instance.collection('tasks').orderBy('createdAt', descending: true).snapshots();
  }
}

// Date and Time Picker Dialog
class DateTimePickerDialog extends StatefulWidget {
  @override
  _DateTimePickerDialogState createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  late DateTime _selectedDateTime;
  late SharedPreferences _prefs;
  late Timer _timer;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _selectedDateTime = DateTime.now();
    _timer = Timer.periodic(Duration(minutes: 1), _checkDateTime);
    _dateFormat = DateFormat('yyyy-MM-dd');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final storedDateTime = _prefs.getInt('selectedDateTime');
    if (storedDateTime != null) {
      setState(() {
        _selectedDateTime = DateTime.fromMillisecondsSinceEpoch(storedDateTime);
      });
    }
  }

  Future<void> _savePrefs() async {
    await _prefs.setInt('selectedDateTime', _selectedDateTime.millisecondsSinceEpoch);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
        _savePrefs();
        storedDate = _selectedDateTime.millisecondsSinceEpoch;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _savePrefs();
        storedTime = (_selectedDateTime.hour * 60) + _selectedDateTime.minute;
      });
    }
  }

  void _checkDateTime(Timer timer) {
    final now = DateTime.now();
    if (now.year == _selectedDateTime.year &&
        now.month == _selectedDateTime.month &&
        now.day == _selectedDateTime.day &&
        now.hour == _selectedDateTime.hour &&
        now.minute == _selectedDateTime.minute) {
      _timer.cancel();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Date and Time Reached'),
          content: Text('The selected date and time have been reached.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Date and Time'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Date: ${_dateFormat.format(_selectedDateTime)}'),
            trailing: Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          ListTile(
            title: Text('Time: ${_selectedDateTime.hour}:${_selectedDateTime.minute.toString().padLeft(2, '0')}'),
            trailing: Icon(Icons.access_time),
            onTap: () => _selectTime(context),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('CANCEL'),
        ),
      ],
    );
  }
}

void _showEditDialog(BuildContext context, String taskId, Map<String, dynamic> taskData) {
  TextEditingController titleController = TextEditingController(text: taskData['title']);
  TextEditingController descriptionController = TextEditingController(text: taskData['description']);

  showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                taskController.updateTask(taskId, titleController.text, descriptionController.text, taskData['date'] ?? 0, taskData['time'] ?? 0);
                Navigator.of(context).pop();
              },
              child: Text('UPDATE'),
            ),
          ],
        ),
      );
    },
  );
}
