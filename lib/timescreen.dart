// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/timeservice.dart';
import 'package:timer_app/utils.dart';
import 'package:timer_app/widgets/progresswidget.dart';
import 'package:timer_app/widgets/timecontroller.dart';
import 'package:timer_app/widgets/timeoptions.dart';
import 'package:timer_app/widgets/timercard.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text("Exemplo Timer", style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>Provider.of<TimeService>(context, listen: false).reset(), 
            icon: Icon(
              Icons.refresh,
              color: Colors.white
              ),
              iconSize: 40,
              )
        ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(height: 15,),
              TimerCard(),
              SizedBox(height: 40,
              ),
              TimeOptions(),
              SizedBox(height: 30,),
              TimeController(),
              SizedBox(height: 30,
              ),
              ProgressWidget()
            ],
            ),
            ),
        ),
      );
  }
}