import 'package:flutter/material.dart';

import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/model/task.dart'; // Import the necessary Firebase utility file

class TaskDetailsPage extends StatelessWidget {
  final String title;
  final String description;

  TaskDetailsPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150, // Increase the height of the app bar
        backgroundColor: Colors.blueAccent, // Set the background color of the app bar to blueAccent
        title: Text(
          'Task Details',
          style: TextStyle(color: Colors.black), // Set the text color of the app bar title to black
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.00555,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color of the container to white
                borderRadius: BorderRadius.circular(20), // Set border radius for a square shape
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task Title :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20,),
                  ),
                  SizedBox(height: 50),
              Text('Task description :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 20,)),
                  SizedBox(height: 8),
                  // Add additional widgets or modify the layout as needed
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        saveDataToFirebase(); // Call the function to save the data to Firebase
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveDataToFirebase() {
    Task task = Task(
      title: title,
      description: description, date: DateTime.daysPerWeek,
    );

    addTaskToFireStore(task)
        .then((value) {

      // Data saved successfully
      print('Task saved to Firebase');
      // You can show a success message or navigate to another screen if needed
    })
        .catchError((error) {
      // Error occurred while saving data
      print('Failed to save task to Firebase: $error');
      // You can show an error message or handle the error in an appropriate way
    });
  }
}
