import 'package:flutter/material.dart';
import 'package:todo/addNote.dart';
import 'package:todo/editNote.dart';
import 'package:todo/home.dart';

class routing extends StatelessWidget {
  const routing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => home(),
        "/addNote": (context) => addNote(),
        "/editNote": (context) => editNote()
      },
    );
  }
}
