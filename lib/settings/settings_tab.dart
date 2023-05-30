import 'package:flutter/material.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/settings/language_bottom_sheet.dart';
import 'package:todo_app/settings/theme_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle1,),

          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:  Theme.of(context).primaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage=='en'?
                  AppLocalizations.of(context)!.english
                      :AppLocalizations.of(context)!.arabic
                    ,

                    style: Theme.of(context).textTheme.headline2,),
                  Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
          ),
          SizedBox(height: 12,),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.subtitle1,),

          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:  Theme.of(context).primaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode()?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,

                    style: Theme.of(context).textTheme.headline2,),
                  Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (context){
          return LanguageBottomSheet();
        });

  }
  void showThemeBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (context){
          return ThemeBottomSheet();
        });
  }
}
