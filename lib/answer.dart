import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:osiete_hiroba/apply.dart';
import 'package:http/http.dart' as http;

class answer extends StatefulWidget{
   const answer({super.key});

 

  @override
  State<answer> createState() => answerState();

}

class answerState extends State<answer>{
  
  String advice = "";

  void sendAdvice(){

  }

  void saveAdvice(String advice) async{
    final url = Uri.https("osiete-hiroba-default-rtdb.firebaseio.com","advice.json");
    //https://がいらないらしい

    var response = await http.post(url,headers:{
      'Content-Type': 'application/json'

    },body:json.encode({
      'sample':advice,
      'datetime':DateTime.now().toString()
    }));

    if(response.statusCode == 200){
      print("saved.");
    }else{
      print("filed.");
    }
  }

  void addAlert(){
    showDialog(context: context, builder: (context)=> const AlertDialog(
      title:Text("エラー：入力がありません"),
      content:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [Text("回答を入力してください")],)
    ));
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text("回答を投稿"),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
           
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: "アドバイス"),
                onChanged: (value) {
                  advice = value;
                },
              ),
            ),
            OutlinedButton(
              onPressed:(){
                saveAdvice(advice);
                 Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>apply(advice)),);
              },//addAlert,
              
              
               
              
              child:const Text('投稿する')

            ),
          ],
        ),
      ),
     //his trailing comma makes auto-formatting nicer for build methods.
    );

}
}