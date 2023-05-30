import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:todo_app/settings/settings_tab.dart';
import 'package:todo_app/task_list/add_task_bottom_sheet.dart';
import 'package:todo_app/task_list/task_list_tab.dart';

class HomwScreen extends StatefulWidget {
static String routName='home';

  @override
  State<HomwScreen> createState() => _HomwScreenState();
}

class _HomwScreenState extends State<HomwScreen> {
int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
appBar: AppBar(
  title: Text(AppLocalizations.of(context)!.app_title,
  style: Theme.of(context).textTheme.headline1,
  ),
),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
currentIndex: selectedIndex,
          onTap:(index){
  selectedIndex=index;
setState(() {

});
          },

          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/list_icon.png')
                ),
            label:AppLocalizations.of(context)!.task_list ,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/Icon feather-settings.png')
              ),
              label:AppLocalizations.of(context)!.settings ,
            ),

          ],
        ),
      ),
        floatingActionButton:FloatingActionButton(onPressed: (){
          showAddButtonSheet();
        },
      child: Icon(Icons.add,
      size: 30,
      ),

    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
body: tabs[selectedIndex],
    );
  }
  List<Widget>tabs =[TaskListTab(),SettingsTab()];

  void showAddButtonSheet() {
    showModalBottomSheet(context: context
        , builder: (context){
      return AddTaskBottomSheet();
        });
  }
}
