import 'package:covid19_app/data%20source.dart';
import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:covid19_app/localization/setlocalization.dart';
import 'package:covid19_app/main.dart';
import 'package:covid19_app/pages/COUNTRYPAGE.dart';
import 'package:covid19_app/panels/infoPanel.dart';
import 'package:covid19_app/panels/mostaffctedcountries.dart';
import 'package:covid19_app/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'models/languagemodel.dart';



class HomePage  extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Map worlddata;
  fetchStatisticsData()async{
    http.Response response=await http.get('https://corona.lmao.ninja/v2/all');
       setState(() { //عشان هغير في ال state لان ال list دي في ال state مكنتش اخده قيمه
             worlddata= json.decode(response.body);
          });
        }

  List countryData;
  fetchCountryData()async{
    http.Response response=await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData= json.decode(response.body);
    });
  }
Map HistoryData;
   fetchHistoryData()async{
    http.Response response=await  http.get('https://corona.lmao.ninja/v2/historical/all');
    setState(() {
      HistoryData=json.decode(response.body);
    });

   }
  @override
  void initState() {//بيجيب الداتا من ال api قبل مايعمل build لل app
    fetchStatisticsData();
    fetchCountryData();
    fetchHistoryData();

   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(setlocalization(context, 'covid_19_app')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              iconSize: 25,
              icon:Icon(Icons.language,color: Colors.white70,),
              onChanged: (Language lang){
                changelanguage(lang);
                },
              items:Language.languagelist().map<DropdownMenuItem<Language>>((e){
                return DropdownMenuItem(
                  value: e,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                     Text(e.flag,style: TextStyle(fontSize: 25),),
                      Text(e.name)
                    ],),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
               color: Color(0xffcceef7),
              child: Row(
                children: [
                  Expanded(child: Text(setlocalization(context, 'quotes'),style: TextStyle(fontSize: 16))),
                 Image(
                   image: AssetImage('images/b.png'),
                   height: 80,

                 )
                ],
              )
            ),

            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 4,
                            color:Colors.white70
                        )
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                      },
                      child: Text(setlocalization(context, 'Regional'),style: TextStyle(
                          fontSize: 16,
                          color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12,right: 12,left: 12,top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${setlocalization(context, 'worldwide')} :',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                  ),),

                ],

              ),
            ),
         worlddata==null?Center(child: CircularProgressIndicator()):   worldwide(mapdata: worlddata,historydata: HistoryData,),
            SizedBox(height:35),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${setlocalization(context, 'Most affected countries')} :',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300
              ),),
            ),
           countryData==null?Center(child: CircularProgressIndicator()): AffectedCountries(countrydata: countryData,),
            InfoPanel(),
            SizedBox(height: 10,),
            Center(
              child: Text('${setlocalization(context, 'We are together in this')}  :)',style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }

changelanguage(Language lang) async {
     Locale temp=await setlocale(lang.languagecode);
    mymainapp.setthelocale(context, temp);

}




}