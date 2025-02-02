class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  NoteForListing(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.lastEditedDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item){
    return NoteForListing(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditedDateTime: item['lastestEditDateTime'] != null
          ? DateTime.parse(item['lastestEditDateTime'])
          : null,
    );
  }
}
