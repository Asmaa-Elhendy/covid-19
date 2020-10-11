import 'package:flutter/material.dart';

class AffectedCountries extends StatelessWidget{
  List countrydata;
  AffectedCountries({this.countrydata});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
     physics: NeverScrollableScrollPhysics(),//عشان ال scroll يبقي من الصفحه نفسها فلغيت هنا ال scroll
      shrinkWrap: true,   //تبقي ع اد ال size اللي عندي بس مش expanded
      itemCount: 5,
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(6),
            child:Row(
              children: [
                Image.network(countrydata[index]["countryInfo"]["flag"],height: 30,),
                SizedBox(width: 5,),
                Text(countrydata[index]["country"]),
                SizedBox(width: 12,),
                Text(countrydata[index]["deaths"].toString(),style: TextStyle(fontWeight: FontWeight.w500),)
              ],
            ),
          );
        }
    );
  }

}