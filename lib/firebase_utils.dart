import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

  CollectionReference<Task>  getTaskCollection(){
    return
  FirebaseFirestore.instance.collection('task').
  withConverter<Task>(
      fromFirestore: ((snapshot,options)=>Task.fromJson(snapshot.data()!)),
      toFirestore: (task,options)=>task.toJson());
}


Future<void>addTaskToFireStore(Task task){
    var taskCollection = getTaskCollection(); /// collection
    var docRef = taskCollection.doc(); /// doc
  task.id = docRef.id ; /// auto generate
  return docRef.set(task);
}
Future<void> deleteTaskFromFireStore(Task task){
   return getTaskCollection().doc(task.id).delete();
}
