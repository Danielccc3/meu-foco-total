// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timer_app/widgets/timercard.dart';
// ignore: unused_import
import 'utils.dart';

class TimerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Exemplo Timer", style: TextStyle(25,Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.refresh,
              color: Colors.white
              ),
              iconSize: 40,
              )
        ],
        )
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 15,),
              TimerCard(),
            ],
            ),
            ),
        ),
      );
  }
}