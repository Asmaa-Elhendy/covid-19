import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InfoChart extends StatelessWidget {
  final Map Historydata;
  String title;

  InfoChart({this.Historydata,this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
          LineChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: getspots(),
                  colors: [ Color(0xff6ec3bc)],
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                  barWidth: 3,
                )
              ]
          )
      ),
    );
  }


  List<FlSpot> getspots() {
    List list=List<FlSpot>();
    if (this.Historydata==null){
  return [
    FlSpot(0,0),
    FlSpot(0,0)
  ];
  }else{
      Map map= Map<String ,dynamic>.from(Historydata[getName()]);
      int i=0;
      for(var item in map.values){
         int ditem=item;
      list.add(FlSpot(i.toDouble(),ditem.toDouble()));
      i++;
      }
      return list;
    }
  }

  String getName(){
    switch(this.title){
      case 'CONFIRMED':
        return 'cases' ;
        break;
      case 'DEATHS':
        return 'deaths' ;
        break;
      case 'RECOVERED':
        return 'recovered' ;
        break;
      default:
        return '';
    }
  }
}