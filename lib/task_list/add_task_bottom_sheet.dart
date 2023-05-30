import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/list_provider/list_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';


class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = "";

  String description = "";
  DateTime selectedDay = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);
  var  provider1 = Provider.of<AppConfigProvider>(context);

    return
       Container(
        decoration: BoxDecoration(
          color: provider1.isDarkMode()?
          MyThemeData.blackColor:
          MyThemeData.whiteColor,
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(10),
        child: Column(

          children: [

            Text(
            AppLocalizations.of(context)!.add_Task ,

              style: Theme.of(context).textTheme.subtitle1,
            ),
            Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        title = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_task_title;
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          labelText: AppLocalizations.of(context)!.enter_Task_Title,

                      ),style:  Theme.of(context).textTheme.subtitle1,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        description = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_task_description;
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: AppLocalizations.of(context)!.enter_Task_description),
                      maxLines: 4,style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      AppLocalizations.of(context)!.select_Date,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        chooseDay();
                      },
                      child: Text(
                        '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.add,
                          style: Theme.of(context).textTheme.headline1,
                        ))
                  ],
                ))
          ],
        ),
      );

  }

  void chooseDay() async {
    var chosenDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDay != null) {
      selectedDay = chosenDay;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedDay.millisecondsSinceEpoch);
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        print(AppLocalizations.of(context)!.todo_was_added);
        provider.getAllTasksFromFirebaseStore();
        Navigator.pop(context);
      });
    }
  }
}
