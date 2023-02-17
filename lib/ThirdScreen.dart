import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final String email;
  final String password;
  const ThirdScreen({Key? key ,required this.email,required this.password}) : super(key: key);



  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Text("${widget.email}"),
           Text("${widget.password}"),
        ],
      ),

    );
  }
}

