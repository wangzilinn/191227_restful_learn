import 'dart:convert';

import 'package:restful_learn/models/api_response.dart';
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
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            lastEditedDateTime: item['lastestEditDateTime'] != null
                ? DateTime.parse(item['lastestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
