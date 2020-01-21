class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  Note(
      {this.noteID,
        this.noteTitle,
        this.noteContent,
        this.createDateTime,
        this.lastEditedDateTime});

  factory Note.fromJson(Map<String, dynamic> item){
    return Note(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditedDateTime: item['lastestEditDateTime'] != null
          ? DateTime.parse(item['lastestEditDateTime'])
          : null,
    );
  }
}