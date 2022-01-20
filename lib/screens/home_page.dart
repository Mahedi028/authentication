import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
          actions: [
            TextButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.logout),
                label: Text(
                  'Sign out',
                ),
                style: TextButton.styleFrom(primary: Colors.white))
          ],
        ),
      ),
    );
  }
}
