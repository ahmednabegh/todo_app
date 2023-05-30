import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');

            },
            child:provider.appLanguage=='en'
                ?
            getSelectedWidget(AppLocalizations.of(context)!.english, context)
                :   getUnSelectedItemWidget(AppLocalizations.of(context)!.english, context),

          ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:
// [
//
//             Text('English',
//             style: Theme.of(context).textTheme.headline3,
//             ),
//             Icon(Icons.check,color: Theme.of(context).primaryColor,)
// ],  ),

          SizedBox(height: 12,)
          ,          InkWell(
            onTap: (){
              provider.changeLanguage('ar');

            },
            child: provider.appLanguage=='ar'?
            getSelectedWidget(AppLocalizations.of(context)!.arabic, context)
                :               getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic, context),



          ),
          // Text('Arabic',
          //
          //   style: Theme.of(context).textTheme.headline2,
          //
          // ),
        ],
      ),
    );
  }
  Widget getSelectedWidget(String text,BuildContext context){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [

          Text(text,
            style: Theme.of(context).textTheme.headline3,
          ),
          Icon(Icons.check,color: Theme.of(context).primaryColor,)
        ],  );

  }
  Widget getUnSelectedItemWidget(String text,BuildContext context){
    var provider = Provider.of<AppConfigProvider>(context);
    return
      Text(text,

        style:
        provider.isDarkMode()?
        Theme.of(context).textTheme.headline2?.copyWith(color:MyThemeData.primarydark):

        Theme.of(context).textTheme.headline2,

      );

  }
}
