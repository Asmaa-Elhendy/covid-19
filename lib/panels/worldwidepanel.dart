import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:covid19_app/localization/setlocalization.dart';
import 'package:covid19_app/widgets/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/new worldwide.dart';


class worldwide extends StatelessWidget {
  final Map mapdata;
  final Map historydata;
  worldwide({this.mapdata,this.historydata});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(), // does not allow the user to scroll.
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: [
        StatisticPanel(
          panelcolor:Color(0xffffe6d7),
          title: 'CONFIRMED',
          count: mapdata["cases"].toString(),
          historydata: historydata,
        ),
        newStatisticPanel(
          panelcolor: Color(0xffffeca8),
          title: 'ACTIVE',
          count: mapdata["active"].toString(),
        ),
        StatisticPanel(
          panelcolor: Color(0xffcceef7),
          title:'RECOVERED',
          count: mapdata["recovered"].toString(),
          historydata: historydata,
        ),
        StatisticPanel(
          panelcolor:Colors.grey[300],
          title: 'DEATHS',
          count: mapdata["deaths"].toString(),
          historydata: historydata,
        ),

      ],
    );
  }
}
class StatisticPanel extends StatelessWidget{
  Color panelcolor;
  String title;
  String count;
  Map historydata;


  StatisticPanel({this.panelcolor, this.title, this.count,this.historydata});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
       padding: EdgeInsets.only(top: 2,right: 4,left: 4),
        margin: EdgeInsets.all(8),
        width: width/2,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              offset: Offset(0,10)
            )
          ]),
        child: Column(
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(),
               Text(setlocalization(context, title),overflow:TextOverflow.ellipsis,style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.bold,
               ),),
             ],
           ),
          SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(count,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),),
                    Text(setlocalization(context, 'People'),style: TextStyle(fontSize: 13 ),)

                  ],
                ),
                Expanded(
                  child: InfoChart(Historydata:historydata,title:this.title,),
                )

              ],
            )

          ],
        ),
      ),
    );
  }

}