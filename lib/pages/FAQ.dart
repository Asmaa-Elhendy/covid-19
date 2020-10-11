import 'package:covid19_app/localization/localization%20methods.dart';
import 'package:flutter/material.dart';

import '../data source.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setlocalization(context, 'FAQs') ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
            itemBuilder: (context,index){
               return ExpansionTile(
                 title:Text( getlanguagecode(context)==Arabic?DataSource.questionAnswersarabic[index]['question']:
                 DataSource.questionAnswers[index]['question']
                   ,style: TextStyle(
                   fontWeight: FontWeight.bold
                 ),),
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(12),
                     child: Text(getlanguagecode(context)==Arabic?DataSource.questionAnswersarabic[index]['answer']:
                     DataSource.questionAnswers[index]['answer']
                     ),
                   )
                 ],
               );
            }
        ),
      ),
    );
  }
}
