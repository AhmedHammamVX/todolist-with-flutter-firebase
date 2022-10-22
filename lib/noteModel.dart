// To parse this JSON data, do
//
//     final noteModel = noteModelFromMap(jsonString);

/* import 'package:meta/meta.dart';

import 'dart:convert';

class NoteModel {
    NoteModel({
        required this.id,
        required this.title,
        required this.isDone,
        required this.createdDate,
    });

    int id;
    String title;
    bool isDone;
    DateTime createdDate;

    

    factory NoteModel.fromJson(String str) => NoteModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
        id: json["ID"],
        title: json["Title"],
        isDone: json["IsDone"],
        createdDate: DateTime.parse(json["CreatedDate"]),
    );

    Map<String, dynamic> toMap() => {
        "ID": id,
        "Title": title,
        "IsDone": isDone,
        "CreatedDate": createdDate.toIso8601String(),
    };
} */

import 'package:meta/meta.dart';
import 'dart:convert';

class NoteModel {
  String id;
  String title;
  bool isDone;
  String createdDate;

  NoteModel(
    this.id,
    this.title,
    this.isDone,
    this.createdDate,
  );

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'isDone': isDone, 'createdDate': createdDate};

  static NoteModel fromJson(Map<String, dynamic> json) {
    return NoteModel(
        json['id'], json['title'], json['isDone'], json['createdDate']);
  }
}
