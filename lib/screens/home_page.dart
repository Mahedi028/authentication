import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
            child: Text(
          'Welcome to Homepage',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
