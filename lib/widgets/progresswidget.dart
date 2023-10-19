import 'package:flutter/material.dart';
import 'package:timer_app/timeservice.dart';
import 'package:timer_app/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${provider.rounds}/4", style: textStyle(30,Colors.grey[350], FontWeight.bold),),
            Text("${provider.goal}/12", style: textStyle(30,Colors.grey[350], FontWeight.bold),)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Rounds", style: textStyle(25,Colors.white, FontWeight.bold),),
            Text("Goals", style: textStyle(25,Colors.white, FontWeight.bold),)
          ],
        )
      ],
    );
  }
}