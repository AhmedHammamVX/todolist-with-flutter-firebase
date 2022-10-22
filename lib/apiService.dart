import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:todo/noteModel.dart';

class ApiService {
  Future<List<NoteModel>> getAllNotes() async {
    var collection = FirebaseFirestore.instance.collection('notes');
    var querySnapshot = await collection.get();
    List<NoteModel> list = querySnapshot.docs
        .map((note) => NoteModel(note.data()['id'], note.data()['title'],
            note.data()['isDone'], note.data()['createdDate']))
        .toList();
    return list;
  }

  Future saveNewNote(String nText) async {
    //get date and time
    DateTime now = DateTime.now();
    String dateNow = DateFormat('kk:mm:ss - EEE d MMM').format(now);

    final notes = FirebaseFirestore.instance.collection("notes").doc();

    final note = NoteModel(notes.id, nText, false, dateNow);

    final json = note.toJson();

    await notes.set(json);
  }

  Future updateNote(String id, String nText) async {
    final note = FirebaseFirestore.instance.collection("notes").doc(id);

    await note.update({"title": nText});
  }

  Future Checked(String id) async {
    final note = FirebaseFirestore.instance.collection("notes").doc(id);

    await note.update({"isDone": true});
  }

  Future deleteNote(String id) async {
    final note = FirebaseFirestore.instance.collection("notes").doc(id);

    await note.delete();
  }
}
