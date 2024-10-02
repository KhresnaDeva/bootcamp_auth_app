import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'crud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthPage(),
      routes: {
        '/crud': (context) => CRUDPage(),
      },
    );
  }
}
