import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:foco_alternativo/services/authentication.dart';
import 'package:foco_alternativo/widgets/utils.dart';
import 'package:image_picker/image_picker.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TIMER')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('TESTE'),
              accountEmail: Text('Teste@gmail'),
              currentAccountPicture: _image != null
                  ? CircleAvatar(
                    child: ClipOval(
                        child: Image.memory(_image!, width: 90, height: 90, fit: BoxFit.cover,),
                      ),
                  )
                  : CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/anonymous-person.jpg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile-bg.jpg')),
              ),
            ),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('Connected devices'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: const Text('Requests'),
              onTap: () => null,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Personal History'),
              onTap: () => null,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Redefine password'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('Change Picture'),
              onTap: () => {
                selectImage(),
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Politicies'),
              onTap: () => null,
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                AuthService().logoff();
              },
            ),
          ],
        ),
      ),
    );
  }
}
