import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyBank());

class MyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Giris()); 
    
  }
}
