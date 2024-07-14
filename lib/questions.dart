import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:osiete_hiroba/answer.dart';
import 'package:osiete_hiroba/apply.dart';

class questions extends StatelessWidget{
  @override
  //initialize
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFafeeee),
      appBar: AppBar(
        title: Text('質問の詳細'),
      ),
      body: Center(
        child: Container(
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              questionCard(context,"A方式とB方式は併願できますか？",
              "内申点的にA方式が狙えるのですが、確実に受かるほどではないのでB方式の受験と迷っています。"),
            
            ElevatedButton(onPressed:() {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>answer()),);
              }, child: Text("この質問に回答する")),
              ]
          )
          

        ),
        
      ),
    );
  }

  Container questionCard(BuildContext context,String t,String s) {
    String _title = t;
    String _summary = s;

    return Container(
              decoration: BoxDecoration(
                border:Border.all(
                  color:Color(0xFF599AE7),
                  width:3.0,
                ),
                borderRadius: BorderRadius.circular(18),
               ),
              child: Padding( 
                padding: EdgeInsets.all(20.0),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("$_title",
                    style: Theme.of(context).textTheme.headlineLarge),
                    Text("$_summary",
                    style: Theme.of(context).textTheme.headlineSmall),
                    Text("age",
                    style: Theme.of(context).textTheme.headlineMedium),
                    ],),
              ),
            );
  }

 

}