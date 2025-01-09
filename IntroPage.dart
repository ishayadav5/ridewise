import 'package:flutter/material.dart';

import 'main.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext  context){
    return Scaffold(
    appBar:AppBar(
    title:Text(''),
         ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text('Welcome!',style:TextStyle(
            fontSize:34,
            fontWeight:FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                 context,
                MaterialPageRoute(
                  builder:(context)=> MyHomePage(),
                )
            );
          }, child:Text('proceed'))
        ],
       ),
     ),
    );

  }
}

