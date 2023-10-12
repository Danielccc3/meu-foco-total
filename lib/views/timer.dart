import 'package:flutter/material.dart';
import 'package:foco_alternativo/services/authentication.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ENTROU')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: (){
              AuthService().logoff();
            },),
          ],
        ),
      ),
    );
  }
}
