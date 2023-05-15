import 'package:flutter/material.dart';
import 'package:todo_app/home/home_screen.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  initialRoute:HomwScreen.routName ,
  routes: {
HomwScreen.routName:(context)=>HomwScreen(),

  },

  debugShowCheckedModeBanner: false,
);

  }
}
