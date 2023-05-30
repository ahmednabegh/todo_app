import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap:(){
            provider.changeTheme(ThemeMode.light);
          }
            ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [

                Text(          AppLocalizations.of(context)!.light ,

                  style: Theme.of(context).textTheme.headline3,
                ),
                Icon(Icons.check,color: Theme.of(context).primaryColor,)
              ],  ),
          ),
          SizedBox(height: 12,)
          ,          InkWell(onTap: (){
            provider.changeTheme(ThemeMode.dark);

          },
            child:   Text(AppLocalizations.of(context)!.dark,

              style:
              provider.isDarkMode()?
              Theme.of(context).textTheme.headline2?.copyWith(color:MyThemeData.primarydark )
                  :
              Theme.of(context).textTheme.headline2,

            ),
          ),
        ],
      ),
    );
  }
}
