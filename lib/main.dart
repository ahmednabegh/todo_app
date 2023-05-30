
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/list_provider/list_provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork() ;
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context)=>ListProvider()),
       ChangeNotifierProvider (create: (context)=>AppConfigProvider()),

  ],
      child: MyApp(),
  ));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);

    return MaterialApp(

  initialRoute:HomwScreen.routName ,
  routes: {
HomwScreen.routName:(context)=>HomwScreen(),

  },

  debugShowCheckedModeBanner: false,
darkTheme: MyThemeData.darkTheme,
theme: MyThemeData.lightTheme,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale(provider.appLanguage),
themeMode: provider.appTheme,
);

  }
}
