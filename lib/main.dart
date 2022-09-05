import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_todo_app/views/homeScreen.dart';
import 'package:simpe_todo_app/views/loginScreen.dart';
import 'package:simpe_todo_app/views/notesScreen.dart';

import 'models/note.dart';

void main() => runApp(SimpleToDoApp());

class SimpleToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MyNotes())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          'notes':(context)=>NotesScreen(),
          'login':(context)=>LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
