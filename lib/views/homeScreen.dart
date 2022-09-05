import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Image(
                  image: AssetImage('images/simpletodo.png'),
                  height: 200,
                ),
              ),
              AnimatedTextKit(
                animatedTexts:[ TyperAnimatedText(
                  'Welcome  !\n to your TODO App',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                    color: Colors.red[200],
                  ),
                  speed: Duration(milliseconds: 80),
                ),
            ]
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text('login'),
                  padding: EdgeInsets.all(10),
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
          ),
        ),
      ),
    ));
  }
}
