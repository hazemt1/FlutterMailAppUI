import 'package:flutter/material.dart';
import 'package:mail_app/AddContact.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
     // home: AddContact(),
    );
  }


}
