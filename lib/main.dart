import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/register_screen.dart';
import 'package:myapp/services/auth_service.dart';

Future<void> main() async {
  // await initializeDefault();
  // await initializeDefault();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'firebase',
        home: StreamBuilder(
            stream: AuthService().firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              }
              return RegisterScreen();
            }));
  }
}
