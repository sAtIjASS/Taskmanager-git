import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; // Import the SQLite package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationListScreen(),
    );
  }
}

class NotificationListScreen extends StatefulWidget {
  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  List<NotificationModel> notifications = []; // Replace NotificationModel with your data model

  @override
  void initState() {
    super.initState();
    // Retrieve notifications from SQLite database when screen initializes
    fetchNotificationsFromDatabase();
  }

  void fetchNotificationsFromDatabase() async {
    // Logic to fetch notifications from SQLite database
    // Replace with your database retrieval logic
    // Example: notifications = await databaseHelper.getNotifications();
    setState(() {
      // Update UI with retrieved notifications
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Reader'),
      ),
      body: notifications.isEmpty
          ? Center(
        child: Text('No notifications yet'),
      )
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].body),
            leading: Text(notifications[index].appHeader),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchNotificationsFromDatabase,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}



//It is the Model Class of NoticationModel
class NotificationModel {
  final String appHeader; // Header indicating the source app
  final String title; // Title of the notification
  final String body; // Body/content of the notification

  NotificationModel({
    required this.appHeader,
    required this.title,
    required this.body,
  });
}
