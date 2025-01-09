import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'IntroPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override

    void initState(){
      super.initState();

      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => IntroPage(),
            ));
      });
  }

  @override
  Widget build(BuildContext context){
       return Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(child:Text('RideWise',style:TextStyle(
            fontSize:34,
            fontWeight: FontWeight.w700,
            color:Colors.white,
          ),
          )
          ),
        ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}