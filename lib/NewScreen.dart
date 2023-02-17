import 'package:flutter/material.dart';
import 'package:untitled3splashscreenandloginpage/ThirdScreen.dart';

class NewScreen extends StatefulWidget {
  final String email;
  final String password;
  const NewScreen({Key? key ,required this.email,required this.password}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.email}"),
            Text("${widget.password}"),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen(  email: widget.email,password: widget.password,
                )),
              );
            }, child: Text('hii'))
          ],
        ),
      ),



    );
  }
}
