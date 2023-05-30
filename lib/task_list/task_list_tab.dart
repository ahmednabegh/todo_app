import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/list_provider/list_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/task_list/task_widget.dart';
class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    if(provider.taskList.isEmpty){
      provider.getAllTasksFromFirebaseStore();

    }
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDay,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
           provider.setNewSelectedDay(date);

            },
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor:MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor:MyThemeData.primaryLight,
            dotsColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) =>true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index){
                  return TaskWidget(task: provider.taskList[index],);
                },
              itemCount: provider.taskList.length,

                ),
          )
        ],
      ),
    );
  }

}
