import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:Fitnesscore/member/register_2.dart';
import 'dart:ui';
import '../utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register1 extends StatefulWidget {
  const register1({Key? key}) : super(key: key);

  @override
  _register1State createState() => _register1State();
}

class _register1State extends State<register1> {
  TextEditingController _firstName=TextEditingController();
  TextEditingController _lasetName=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  final auth= FirebaseAuth.instance; //fire base object
  bool secure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Container(
            //the circular border //base
            padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
            width: double.infinity,
            decoration: BoxDecoration (
              // color: Colors.red,
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SingleChildScrollView(
              child: Column(// start item
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color:Colors.green,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                          child: Text(
                            'Hey there,',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.5, //2
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          'Create an Account',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height:1.5,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 147),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.white),
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                              width: 89,
                              height: double.infinity,
                              child: Center(
                                child: TextField(
                                  controller: _firstName,
                                  decoration:InputDecoration(
                                    hintText: "First Name",
                                    hintStyle:SafeGoogleFont (
                                      'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 4.5,
                                      color: Color(0xffaca4a5),
                                    ),
                                    prefixIcon: Icon(Icons.person_outline),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none
                                    ),
                                  ) ,
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                ),
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.white),
                            color:  Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                              width: 89,
                              height: double.infinity,
                              child: TextField(
                                controller: _lasetName,
                                decoration:InputDecoration(
                                  hintText: "Last Name",
                                  hintStyle:SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 4.5,
                                    color: Color(0xffaca4a5),
                                  ),
                                  prefixIcon: Icon(Icons.person_outline),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                  ),
                                ) ,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration (
                            border: Border.all(color:Colors.white),
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                              width: 89,
                              height: double.infinity,
                              child: TextField(
                                controller: _email,
                                decoration:InputDecoration(
                                  hintText: "Email",
                                  hintStyle:SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 4.5,
                                    color: Color(0xffaca4a5),
                                  ),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                  ),
                                ) ,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.white),
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                              width: 89,
                              height: double.infinity,
                              child: TextField(
                                obscureText: secure,
                                controller: _password,
                                decoration:InputDecoration(
                                  hintText: "Password",
                                  hintStyle:SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 4.5,
                                    color: Color(0xffaca4a5),
                                  ),

                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          secure=!secure;
                                        });
                                      },
                                      child: secure?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                  ),
                                ) ,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      setState(() {
                        try{
                          var AppUser=auth.createUserWithEmailAndPassword(email: _email.text.toString(),
                              password: _password.text.toString());
                          print("My Email");
                          print(_email.text.toString());
                          print("My pass");
                          print(_password.text.toString());

                          // if the operation done the app will move to next page
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>register2(_email.text.toString(),_password.text.toString(),_firstName.text.toString(),_lasetName.text.toString())));
                        }
                        catch(e){print(" my erorr $e");}
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(99),
                        gradient: LinearGradient (
                          begin: Alignment(1, 1),
                          end: Alignment(-1.479, -1.615),
                          colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                          stops: <double>[0, 1],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x4c95adfe),
                            offset: Offset(0, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                    children: [
                      SizedBox(
                        child: Divider(color:Colors.black ,),
                        width:150,
                      ),
                      Text("  Or  "),
                      SizedBox(
                        child: Divider(color:Colors.black ,),
                        width:150,
                      ),
                    ],
                  ),),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height:MediaQuery.of(context).size.height/25,
                  //color: Colors.grey,
                    child: Row(
                      children: [
                        Text(" Already have an account?" ,style:SafeGoogleFont (
                          'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black,
                        ), ),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Login",style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          color: Colors.purpleAccent,
                        ),))
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
