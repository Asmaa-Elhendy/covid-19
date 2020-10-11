
import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (_)=>HomePage()
          ));
        },
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text:'${setlocalization(context, 'covid_19_app')} \n' ,style: TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
                      TextSpan(text:setlocalization(context, 'touch') ,style: TextStyle(fontSize:20,fontWeight: FontWeight.w100)),
                    ]
                ),
              )

            ],)),
        ),
      ),
    );
  }
}
