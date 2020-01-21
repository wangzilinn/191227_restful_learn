import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restful_learn/models/note.dart';
import 'package:restful_learn/services/notes_service.dart';

class NoteModify extends StatefulWidget {

  final String noteID;

  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NotesService get notesService => GetIt.I<NotesService>();

  String errorMessage;

  Note note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading  = false;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      notesService.getNote(widget.noteID)
      .then((response){
        setState(() {
          _isLoading = false;
        });
        if(response.error){
          errorMessage = response.errorMessage ?? 'An error occurrrd';
        }
        note = response.data;
        _titleController.text = note.noteTitle;
        _contentController.text = note.noteContent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit note' : 'Create note' ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? CircularProgressIndicator() : Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Note title"
              ),
            ),
            Container(height: 8,),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                  hintText: "Note content"
              ),
            ),

            Container(height: 16,),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white),),
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if (isEditing){
                    // update note
                  }else{
                    //create note
                  }
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
