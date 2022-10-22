import 'package:flutter/material.dart';
import 'package:todo/apiService.dart';

class editNote extends StatefulWidget {
  const editNote({super.key});

  @override
  State<editNote> createState() => _editNoteState();
}

ApiService api = ApiService();

String note = "";

var _formKey = GlobalKey<FormState>();

class _editNoteState extends State<editNote> {
  @override
  Widget build(BuildContext context) {
    var args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(label: Text("note"), icon: Icon(Icons.abc)),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must enter your note!";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    note = value;
                    print(note + "live");
                  });
                },
                initialValue: args['nText'],
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // showing notification when saved
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      print(note + "from edit note");
                      if (note == "") {
                        note = args['nText'];
                      }
                      api.updateNote(args['id'].toString(), note);
                      note = "";
                    }
                    return;
                  },
                  child: const Text('Edit'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // showing notification when saved
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      print(note + "from edit note");
                      api.deleteNote(args['id']);
                      Navigator.of(context).pop();
                      setState(() {
                        note = "";
                      });
                    }
                    return;
                  },
                  child: const Text('Delete'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
