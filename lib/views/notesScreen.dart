import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_todo_app/callAPI.dart';
import 'package:simpe_todo_app/models/note.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    callAPI();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String note = '';
    return Consumer<MyNotes>(
        builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('TODO List..!'),
          backgroundColor: Colors.white10,
          actions: [
            Hero(
              tag: 'logo',
              child: CircleAvatar(
                backgroundImage: AssetImage('images/logoToDo.png'),
                radius: 35,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    note = value;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red.shade200,
                      width: 3,
                    ),
                  ),
                  hintText: 'add a new note',
                  counterStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () async {
                      MyNotes().addNote(note);
                      await CallAPI().addNote(note);
                      print(MyNotes().Count);
                    },
                    fillColor: Colors.white12,
                    child: Text('add'),
                  ),
                ],
              ),
              Consumer<MyNotes>(builder: (context, value, child) {
                if (value.list.isEmpty) {
                  return Center(
                    child: Text('empty'),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, ind) =>
                        ListTile(
                          title: value.list[ind],
                          trailing: Checkbox(onChanged: (bool? value) {},
                            value: value.list[ind].isDone,
                          ),
                        ),
                  );
                }
              }),
            ],
          ),
        ),
    );
    }
    );
  }
  callAPI() async {

    List<Note>? _list=[];
    _list = (await CallAPI().getNotes()).cast<Note>();

    for(int i=0;i<_list.length;i++)
      {
        MyNotes().addNote(_list[i].title);
      }
  }
}

