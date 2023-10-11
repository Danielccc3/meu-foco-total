import 'package:flutter/material.dart';
import 'package:foco_alternativo/services/authentication.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ENTROU')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(leading: Icon(Icons.logout), title: Text('Logout'), onTap: (){
              AuthService().logoff();
            },),
          ],
        ),
      ),
    );
  }
}
