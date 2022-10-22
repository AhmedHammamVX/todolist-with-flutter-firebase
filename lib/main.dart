import 'package:flutter/material.dart';
import 'package:todo/addNote.dart';
import 'package:todo/home.dart';
import 'package:todo/routing.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: routing(),
    );
  }
}


/* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */


//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


