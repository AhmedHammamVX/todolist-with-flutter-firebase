import 'package:flutter/material.dart';
import 'package:todo/apiService.dart';

class addNote extends StatefulWidget {
  const addNote({super.key});

  @override
  State<addNote> createState() => _addNoteState();
}

ApiService api = ApiService();

String note = "";
var _formKey = GlobalKey<FormState>();

saveNote(context) {
  if (_formKey.currentState!.validate()) {
    // showing notification when saved
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
    api.saveNewNote(note);
  }
  return;
}

class _addNoteState extends State<addNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
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
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: ElevatedButton(
                  onPressed: () {
                    saveNote(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
