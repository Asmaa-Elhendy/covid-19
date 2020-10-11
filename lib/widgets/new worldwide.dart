import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
class NewWorldWide extends StatelessWidget{

  final String title;
  final String effectednum;
  final Color iconcolor;
  final Function press;

  const NewWorldWide({Key key, this.title, this.effectednum, this.iconcolor, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context,constraints){
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth/2-10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,10),

                  color: Colors.grey[100]
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ]
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                                children:[
                                  TextSpan(text: '$effectednum \n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  TextSpan(text:setlocalization(context, 'People'),style: TextStyle(fontSize: 12))
                                ] )
                        ),
                      ),
                    //  Expanded
                    ],
                  )
                  ),

              ],
            ),
          ),
        );
      },
    );
  }

}*/
class newStatisticPanel extends StatelessWidget{
  Color panelcolor;
  String title;
  String count;


  newStatisticPanel({this.panelcolor, this.title, this.count});

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

         Center(
                      child: Text(count,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),),
                    ),

         Row(mainAxisAlignment: MainAxisAlignment.start,
           children: [
            Text(setlocalization(context, 'People'),style: TextStyle(fontSize: 13 ),)
                          ],
                        )

                  ],
                ),

      ),
    );
  }

}