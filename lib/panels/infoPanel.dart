import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:covid19_app/pages/FAQ.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
        children: [
          Buttoninfo(title: setlocalization(context, 'FAQs'),callback: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FaqPage()));
          },),
          Buttoninfo(title: setlocalization(context, 'DONATE'),callback:(){ launch('https://covid19responsefund.org/en/');}),
          Buttoninfo(title: setlocalization(context, 'Myth-busters'),callback:(){ launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');})
     ] )
    );
  }
}
class Buttoninfo extends StatelessWidget {
  String title;
  VoidCallback callback;
  Buttoninfo({this.title,this.callback});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        color: Color(0xff6ec3bc),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
            Icon(Icons.arrow_forward,color: Colors.white,
            )
          ],
        ),
    ),
      );
  }
}

