
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeUtility {
 static AppTheme customAppTheme() {
    return AppTheme(
      id: "custom_theme",
      description: "Custom Color Scheme",
      data: ThemeData(
        accentColor: Colors.yellow,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.yellow[200],
        buttonColor: Colors.amber,
        dialogBackgroundColor: Colors.yellow,
      ),
    );
  }
 static AppTheme customAppTheme2() {
   return AppTheme(
     id: "custom_theme2",
     description: "Custom Color Scheme",
     data: ThemeData(
       accentColor: Colors.white,
       primaryColor: Colors.indigoAccent,
       scaffoldBackgroundColor: Colors.white,
       buttonColor: Colors.indigoAccent,
       dialogBackgroundColor: Colors.red,
     ),
   );
 }
  static List<AppTheme> getThemes(){
    List<AppTheme> themes= [];

    themes.add(customAppTheme());
    themes.add(customAppTheme2());
    themes.add(AppTheme.dark());
    themes.add(AppTheme.light());
    return themes;
  }
  static AppTheme getCurrentThemeWithId(String themeid){
    List<AppTheme> themes= [];
AppTheme currentTheme=AppTheme.light();
    themes.add(customAppTheme());
    themes.add(customAppTheme2());
    themes.add(AppTheme.dark());
    themes.add(AppTheme.light());
   themes.forEach((t)=>{
     if(t.id==themeid){
       currentTheme=t,

     }
   });
   return currentTheme;
  }
}