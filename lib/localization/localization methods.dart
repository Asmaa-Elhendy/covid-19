import 'package:covid19_app/localization/setlocalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


String  setlocalization(BuildContext context,String key){
  return SetLocalization.of(context).translate(key);
}

String getlanguagecode(BuildContext context){
  return SetLocalization.of(context).getlangcode();
}

const String languagecode='langcode';
const String English='en';
const String Arabic='ar';
  Future<Locale>setlocale(String language_code)async{
  SharedPreferences preferences =await  SharedPreferences.getInstance();
  preferences.setString(languagecode, language_code);
  return switchlocal(language_code);

}


Locale switchlocal(lang){
  Locale temp;
  switch (lang) {
    case English:
      temp = Locale(English, 'US');
      break;
    case Arabic:
      temp = Locale(Arabic, 'EG');
      break;
    default:
      temp = Locale(English, 'US');
      break;
  }
  return temp;
}

Future getlocale()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String langcode=preferences.getString(languagecode)??English;
   return switchlocal(langcode);
}