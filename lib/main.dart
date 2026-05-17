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
        backgroundColor:  Color(0xFFF8F0F0),
        appBar: AppBar(
          title: const Text("Eternal To Do App", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color(0xFFF8F0F0)),),
          backgroundColor: const Color(0xFF393D3F),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout, color:  Color(0xFFF8F0F0),))],
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor:  Color(0xFF393D3F),
        ),
        body: Center(
          child: Container(
            height:450,
            width:300,
            decoration: BoxDecoration(
              color:  Color(0xFF393D3F),
              borderRadius: BorderRadius.circular(20),
            ),
            padding:EdgeInsets.all(25),
            child: Text('To Do List', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:  Color(0xFFF8F0F0),)),),
        ),
      ),
    );
  }
}