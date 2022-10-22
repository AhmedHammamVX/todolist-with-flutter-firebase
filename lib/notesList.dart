import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/addNote.dart';
import 'package:todo/apiService.dart';
import 'package:todo/noteModel.dart';
import 'package:todo/notesChecked.dart';

class notesList extends StatefulWidget {
  const notesList({super.key});

  @override
  State<notesList> createState() => _notesListState();
}

class _notesListState extends State<notesList> {
  ApiService api = ApiService();
  List<NoteModel> notes = [];

  fetchData() async {
    var temp = await api.getAllNotes();
    setState(() {
      notes = temp.where((e) => e.isDone == false).toList();
      ;
    });
  }

  @override
  void initState() {
    super.initState();
    print("should be printed hereeee");
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
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                "/editNote",
                                                arguments: {
                                                  "id": notes[index].id,
                                                  "nText": notes[index].title
                                                });
                                          },
                                          icon: Icon(
                                              FontAwesomeIcons.penToSquare,
                                              color: Color.fromARGB(
                                                  255, 62, 62, 62),
                                              size: 18.0)),
                                      IconButton(
                                          onPressed: () {
                                            api.Checked(notes[index].id);
                                            fetchData();
                                          },
                                          icon: Icon(FontAwesomeIcons.check,
                                              color: Color.fromARGB(
                                                  255, 62, 62, 62),
                                              size: 18.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/addNote");
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addNote()),
          ).then((value) => setState(() {})); */
        },
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
