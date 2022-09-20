import 'package:flutter/material.dart';
import 'package:localdata/addnote.dart';
import 'package:localdata/frist.dart';
import 'package:localdata/home.dart';
import 'package:localdata/home1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: frist(),
      routes: {
        "addnotes": (context) => addnote(),
        "home1": (context) => home1()
      },
    );
  }
}
