import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/notesChecked.dart';
import 'package:todo/notesList.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("To Do List"),
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(FontAwesomeIcons.listOl,
                        color: Colors.white, size: 20.0)),
                Tab(
                    icon: Icon(FontAwesomeIcons.check,
                        color: Colors.white, size: 20.0))
              ],
            ),
          ),
          body: TabBarView(children: [
            notesList(),
            notesChecked(),
          ]),
        ));
  }
}
