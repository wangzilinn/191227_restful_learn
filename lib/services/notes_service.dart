import 'dart:convert';

import 'package:restful_learn/models/api_response.dart';
import 'package:restful_learn/models/note.dart';
import 'package:restful_learn/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = "http://api.notes.programmingaddict.com";
  static const header = {'apiKey': "08d78f79-850f-1169-623a-a3e679839c1d"};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: header).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          NoteForListing note = NoteForListing.fromJson(item);
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: header).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }


  Future<APIResponse<bool>> createNote() {
    return http.get(API + '/notes/', headers: header).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
