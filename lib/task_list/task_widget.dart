import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/list_provider/list_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/task_list/task_widget_details.dart';

class TaskWidget extends StatefulWidget {
  Task task;

  TaskWidget({required this.task});

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;

  void _openTaskDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailsPage(
          title: widget.task.title,
          description: widget.task.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    var provider1 = Provider.of<AppConfigProvider>(context);
    return GestureDetector(
      onTap: _openTaskDetailsPage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                onPressed: (context) {
                  deleteTaskFromFireStore(widget.task)
                      .timeout(Duration(milliseconds: 500), onTimeout: () {
                    print('task was deleted');
                    provider.getAllTasksFromFirebaseStore();
                  });
                },
                backgroundColor: MyThemeData.redColor,
                foregroundColor: provider1.isDarkMode()
                    ? MyThemeData.primarydark
                    : MyThemeData.whiteColor,
                icon: Icons.delete,
                label: AppLocalizations.of(context)!.delete,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: provider1.isDarkMode()
                  ? MyThemeData.blackColor
                  : MyThemeData.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  color: provider1.isDarkMode()
                      ? MyThemeData.primarydark
                      : MyThemeData.primaryLight,
                  height: 80,
                  width: 4,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.task.title,
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: isDone ? Colors.green : MyThemeData.primaryLight),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.task.description,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isDone = !isDone;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isDone
                          ? Colors.green
                          : provider1.isDarkMode()
                          ? MyThemeData.primaryLight
                          : MyThemeData.primaryLight,
                    ),
                    child: isDone
                        ? Text(
                      'Done',
                      style: TextStyle(
                        color: provider1.isDarkMode()
                            ? MyThemeData.whiteColor
                            : MyThemeData.whiteColor,
                        fontSize: 16,
                      ),
                    )
                        : Icon(
                      Icons.check,
                      color: provider1.isDarkMode()
                          ? MyThemeData.whiteColor
                          : MyThemeData.whiteColor,
                      size: 20,
                    ),                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
