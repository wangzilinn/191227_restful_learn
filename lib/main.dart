import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restful_learn/services/notes_service.dart';
import 'views/note_list.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(App());
}


class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: NoteList(),
    );
  }
}

