import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class apply extends StatelessWidget{
  @override
  //initialize
  apply(this.gotadvice);
  String gotadvice;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿成功'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
       
        children: <Widget>[
          Text("投稿した回答：",
          style:Theme.of(context).textTheme.headlineSmall),
          Text("$gotadvice",
          style: Theme.of(context).textTheme.headlineMedium,)
        ],)

        
      ),
    );
  }

 

}