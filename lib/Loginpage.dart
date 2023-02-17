

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled3splashscreenandloginpage/NewScreen.dart';
import 'model class.dart';


import 'SplashScreen.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailcontroller = TextEditingController     (text:"");
  TextEditingController passwordcontroller = TextEditingController  (text:"");
  //imp
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            'LOGIN PAGE',
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.black38),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image1.png'),
            fit: BoxFit.fitHeight,
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Icon(
                  Icons.contact_mail_rounded,
                  size: 100,
                  color: Colors.white70,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailcontroller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Textfield is empty';
                    }
                    return null;
                  },
                  //(backspace texfield is empty)
                  onChanged: (value){
                    _formKey.currentState!.validate();
                  },
                   controller: passwordcontroller,
                   style: TextStyle(color: Colors.black),
                   decoration: InputDecoration(
                       border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                       hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black)
                   ),

               ),

                SizedBox(height: 30,),

                Text('Forgot password', style: TextStyle(color: Colors.white),),
                SizedBox(height:20 ,),
                ElevatedButton(onPressed: (){

                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    post(emailcontroller.text.trim(), passwordcontroller.text.trim(),context);
                  }
                  // print(emailcontroller.text);

                }, child: Text('Login',)),
                SizedBox(height: 100,),
                Text('New User? Create Account', style: TextStyle(decoration: TextDecoration.underline, color: Colors.white),)

              ],
            ),
          ),
        ),
      ),
    );
  }
  post(String email, String password, BuildContext context) async {
    print(email);
    print(password);

    final response = await http.post(
        Uri.parse(
            "https://staging.get-licensed.co.uk/guardpass/api/auth/login"),
        body: {'email_address': email, 'password': password});

    print(response.statusCode);
    print(response.body);



    print(response);
    if(response.statusCode==200 ){
      var data = jsonDecode(response.body);
      King k = King.fromMap(data);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewScreen(  email: k.emailAddress!,password: passwordcontroller.text,
          )),
      );
    }


  }





}
