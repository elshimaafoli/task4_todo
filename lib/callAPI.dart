import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/note.dart';

class CallAPI {
  Future<void> addNote(String title) async {
    //"https://api.mohamed-sadek.com/Task/POST"
    Uri path = Uri.https('api.mohamed-sadek.com', "/Task/POST");
    http.Response response = await http.post(path, body: {
      "title": title,
    });
  }
  Future<List> getNotes () async{
    List<Note> returnedList=[];
    //https://api.mohamed-sadek.com/Task/Get
    Uri path=Uri.https('api.mohamed-sadek.com', '/Task/Get');
    http.Response response= await http.get(path);
    if (response.statusCode == 200) {
      var conerted = jsonDecode(response.body);
      var data=conerted["Data"] as List;
      returnedList=data.map((e) => Note(
        id: e['ID'],
        title: e['Title'],
        isDone: e['IsDone'],
        createdDate: e['CreatedDate'],
      )).toList();
      print(returnedList.length);
    }
    else
      {
        print('false');
      }
    return returnedList;
  }
}
