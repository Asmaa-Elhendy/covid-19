import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:covid19_app/localization/setlocalization.dart';
import 'package:flutter/material.dart';

import 'data source.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'myapp.dart';

void main(){
  runApp(mymainapp());
}
class mymainapp extends StatefulWidget {

  static void setthelocale(BuildContext context,Locale locale){
    _mymainappState localestate=context.findAncestorStateOfType<_mymainappState>();
      localestate.setlocale(locale);

  }
  @override
  _mymainappState createState() => _mymainappState();
}

class _mymainappState extends State<mymainapp> {
  Locale _locale;
   void setlocale(Locale locale){
  setState(() {
   _locale=locale;
  });
  }


  @override
  void didChangeDependencies() {
     super.didChangeDependencies();
    getlocale().then((locale){
      setState(() {
        this._locale=locale;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if(_locale==null){
      return CircularProgressIndicator();
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Circular',
            primaryColor:primarycolorapp
        ),
        locale: _locale,
        supportedLocales: [
          Locale('en','US'),
          Locale('ar','EG')
        ],
        localizationsDelegates: [
          SetLocalization.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (locale,supportedLocales){
          for(var supported in supportedLocales){
            if(supported.languageCode==locale.languageCode&&
                supported.countryCode==locale.countryCode){
              return supported;
            }
          }
          return supportedLocales.first;
        },

        home: Myapp(),

      );
    }
  }
}

