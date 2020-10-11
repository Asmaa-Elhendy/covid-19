import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetLocalization{
  Locale locale;
  SetLocalization({this.locale});
  static SetLocalization of(BuildContext context){
    return Localizations.of(context, SetLocalization);
  }
 static localizationdelegate delegate =localizationdelegate();

  Map<String,String> localizedjson;

 Future<bool> load()async{
    String jsonstring=await rootBundle.loadString('langs/${locale.languageCode}.json');
    Map<String,dynamic> jsonmap=json.decode(jsonstring);
    localizedjson=jsonmap.map((key, value) {
      return MapEntry(key,value.toString());
    });
    return true;
 }

 String translate(String key){
   return localizedjson[key];
 }
 getlangcode(){
   return locale.languageCode;
 }
  
}
class localizationdelegate extends LocalizationsDelegate<SetLocalization> {
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async{
    // TODO: implement load
    SetLocalization localization =SetLocalization(locale: locale);
    await localization.load();
    return localization;

  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    // TODO: implement shouldReload
    return false;
  }
  
}