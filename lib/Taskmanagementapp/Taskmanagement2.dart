import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  Future<void> addTask(String title, String description, int storedDate, int storedTime) async {
    try {
      if (title.isEmpty || description.isEmpty || storedDate == null || storedTime == null) {
        Get.snackbar('Error', 'Please fill in all fields');
        return;
      }
      await FirebaseFirestore.instance.collection('tasks').add({
        'title': title,
        'description': description,
        'createdAt': FieldValue.serverTimestamp(),
        'date': storedDate,
        'time': storedTime,
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

  Future<void> updateTask(String taskId, String title, String description, int storedDate, int storedTime) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
        'title': title,
        'description': description,
        'date': storedDate,
        'time': storedTime,
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task: $e');
    }
  }

  Stream<QuerySnapshot> getTasksStream() {
    return FirebaseFirestore.instance.collection('tasks').orderBy('createdAt').snapshots();
  }
}

class TaskListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _selectedDate = DateTime.now().millisecondsSinceEpoch;
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: taskController.getTasksStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No tasks found.'));
          }

          var tasks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
              var taskId = task.id;
              var taskData = task.data() as Map<String, dynamic>;

              return ListTile(
                title: Text(taskData['title']),
                subtitle: Text(taskData['description']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => taskController.deleteTask(taskId),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditTaskDialog(context, taskId, taskData),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Add Task'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date'),
                    ),
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text('Select Time'),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    taskController.addTask(
                      titleController.text,
                      descriptionController.text,
                      _selectedDate,
                      _selectedTime.hour * 60 + _selectedTime.minute,
                    );
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('ADD'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, String taskId, Map<String, dynamic> taskData) {
    TextEditingController titleController = TextEditingController(text: taskData['title']);
    TextEditingController descriptionController = TextEditingController(text: taskData['description']);

    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Edit Task'),
            content: SingleChildScrollView(
              child: Column(
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
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('CANCEL'),
              ),
              TextButton(
                onPressed: () {
                  taskController.updateTask(taskId, titleController.text, descriptionController.text, taskData['date'], taskData['time']);
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (pickedDate != null) {
      _selectedDate = pickedDate.millisecondsSinceEpoch;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      _selectedTime = pickedTime;
    }
  }
}
