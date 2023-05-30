import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  ThemeMode appTheme =ThemeMode.light;
  void changeLanguage(String newLanguage){
    if(newLanguage==appLanguage){
      return ;
    }
    appLanguage=newLanguage;
    notifyListeners();
  }
  void changeTheme(ThemeMode newMode){
    if(newMode == appTheme){
      return ;
    }
    appTheme = newMode;
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme ==ThemeMode.dark;
  }
}