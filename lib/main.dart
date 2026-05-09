import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
          child: Container(
            height:450,
            width:300,
            decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            padding:EdgeInsets.all(25),
            child: Text('To Do List', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,)),),
        ),
      ),
    );
  }
}