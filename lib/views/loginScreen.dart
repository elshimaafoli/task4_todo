import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(title: Text('Welcome Back..!',),
       backgroundColor: Colors.white10,
     ),
     body: Form(child: ListView(
       padding: EdgeInsets.only(top:50),
       children: [
         Hero(
           tag: 'logo',
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(40),
               child: Image(
                 image: AssetImage('images/loginImg.jpg',),
                 filterQuality: FilterQuality.medium,
                 height: 250.0,
                 width: 200.0,
               ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
                 borderSide: BorderSide(width: 3,
                     color: Colors.red.shade200),
               ),
               focusedBorder:
                   OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide(width: 3,
                       color: Colors.red.shade200),),
               hintText: 'E-mail',
               hintStyle: TextStyle(
                 fontSize: 18,
                 wordSpacing: 2,
               ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
             obscureText: true,
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
                 borderSide: BorderSide(width: 3,
                     color: Colors.red.shade200),
               ),
                 focusedBorder:
                 OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide(width: 3,
                       color: Colors.red.shade200),),
               hintText: 'Password',
                 hintStyle:TextStyle(
                   fontSize: 18,
                   wordSpacing: 2,
                 )
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: RawMaterialButton(
             onPressed: () {
               Navigator.pushNamed(context, 'notes');
             },
             child: Text('Login'),
             padding: EdgeInsets.all(15),
             fillColor: Colors.white12,
             textStyle: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
             shape:  RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
               side: BorderSide.none,
               //Colors.red[900],
             ),
           ),
         ),
       ],
     ),),
   );
  }

}