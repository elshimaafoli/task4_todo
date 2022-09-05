import 'package:flutter/cupertino.dart';

class Note {
  int id;
  String title;
  bool isDone;
  String createdDate;
  Note(
      {required this.id,
      required this.title,
       this.isDone=false,
      this.createdDate = "2022-09-04T13:14:03.090Z"});
}

class MyNotes extends ChangeNotifier {
  List<Note> _notes = [];
  static int num = 1;
   get list {
    return _notes;
  }

  get Count {
    return _notes.length;
  }

  addNote(String title) {
    _notes.add(Note(id:num++, title: title));
    print('hi${num}   title${title}');
    notifyListeners();
  }

  removeNote(int id) {
    for (int i = 0; i < _notes.length; i++) {
      if (_notes[i].id == id) {
        _notes.remove(_notes[i]);
      }
    }
    notifyListeners();
  }

  isDoneUpdate(int id,bool val){
    for (int i = 0; i < _notes.length; i++) {
      if (_notes[i].id == id) {
        _notes[i].isDone=val;
      }
    }
    notifyListeners();
  }

  titleUpdate(int id,String title){
    for (int i = 0; i < _notes.length; i++) {
      if (_notes[i].id == id) {
        _notes[i].title=title;
      }
    }
    notifyListeners();
  }
}
