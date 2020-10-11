import 'dart:convert';
import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CountryPage extends StatefulWidget {
  @override
  CountryPageState createState() => CountryPageState();
}

class CountryPageState extends State<CountryPage> {
  List countrypagelist;
  fetchcountry()async{
    http.Response response= await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
     setState(() {
       countrypagelist=json.decode(response.body);
     });
  }

  @override
  void initState() {
    super.initState();
    fetchcountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setlocalization(context, 'Countries Status')),
      ),
      body:countrypagelist==null?Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount: countrypagelist==null?0:countrypagelist.length,
          itemBuilder: (context,index){
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   offset: Offset(0,10), //اتجاهه
                     blurRadius:10,  //ارتفاعه
                   color: Colors.grey[100]
                 )
               ]
             ),
           child: Row(

              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${index+1}-${countrypagelist[index]['country']}',style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(countrypagelist[index]['countryInfo']['flag'],height: 50,width: 60,)
                    ],
                  ),

                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${setlocalization(context, 'CONFIRMED')} : '+countrypagelist[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${setlocalization(context, 'ACTIVE')} : '+countrypagelist[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${setlocalization(context, 'RECOVERED')} : '+countrypagelist[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${setlocalization(context, 'DEATHS')} : '+countrypagelist[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold),)


                      ],
                    ),
                  ),
                )


              ],
            )
          );
          }
      ),
    );
  }
}
