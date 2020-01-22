import 'package:flutter/cupertino.dart';

class NoteInsert {
  String noteTitle;
  String noteContent;

  NoteInsert({
    @required this.noteTitle,
    @required this.noteContent
  });


  Map<String, dynamic> toMap() {
    return {
      "noteTitle": noteTitle,
      "noteConten": noteContent
    };
  }
}