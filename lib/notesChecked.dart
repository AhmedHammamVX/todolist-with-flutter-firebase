import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/apiService.dart';
import 'package:todo/noteModel.dart';

class notesChecked extends StatefulWidget {
  const notesChecked({super.key});

  @override
  State<notesChecked> createState() => _notesCheckedState();
}

class _notesCheckedState extends State<notesChecked> {
  ApiService api = ApiService();
  List<NoteModel> notes = [];
  List<NoteModel> notesAfilter = [];

  fetchData() async {
    var temp = await api.getAllNotes();
    setState(() {
      notes = temp.where((e) => e.isDone == true).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    print("should be printed checked");
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      body: (notes.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 3.0,
                              shadowColor: Colors.blueGrey,
                              child: ListTile(
                                title: Text(notes[index].title),
                                subtitle: Text(notes[index].createdDate),
                              ),
                            ),
                          )),
                )
              ],
            ),
    );
  }
}
