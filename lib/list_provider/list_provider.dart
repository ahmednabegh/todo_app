import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/model/task.dart';

class ListProvider extends ChangeNotifier {

  List<Task> taskList=[];
  DateTime selectedDay = DateTime.now();

  getAllTasksFromFirebaseStore()async{
    QuerySnapshot<Task>querySnapshot =await getTaskCollection().get();
    /// list<tasks>=> list< QuerySnapshot<Task>>
    taskList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
taskList =taskList.where((task){
DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
if(selectedDay.day==taskDate.day &&
selectedDay.month==taskDate.month &&
selectedDay.year==taskDate.year){
  return true;
}
return false ;
}).toList();

/// sort
taskList.sort((Task task1, Task task2) {
      DateTime date1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
     return date1.compareTo(date2);

    });



   notifyListeners();
  }
void setNewSelectedDay(DateTime newDate){
    selectedDay =newDate;
getAllTasksFromFirebaseStore();
  }
}