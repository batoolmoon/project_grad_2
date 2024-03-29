import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:Fitnesscore/home/dash_bord.dart';
import 'package:Fitnesscore/member/register_1.dart';
import 'dart:ui';
import '../utils.dart';


class LogIn2 extends StatefulWidget {
  const LogIn2({Key? key}) : super(key: key);

  @override
  _LogIn2State createState() => _LogIn2State();
}

class _LogIn2State extends State<LogIn2> {

  final _formfield=GlobalKey<FormState>();

  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  final auth=FirebaseAuth.instance;
  bool secure=true;


  Future<void> LogInMethod(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBord()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user-not-found');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert('User-not-found');
          },
        );
      } else if (e.code == 'wrong-password') {
        print('wrong-password');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert('Wrong-password');
          },
        );
      } else {
        print('wrong');
      }
    } catch (e) {
      print("I am an Error : $e");
    }
  }

  alert(text){
    return  AlertDialog(
      title: Text('Error Message' , style: TextStyle(color: Colors.red),),
      content: Text(text+ ", try again"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30*fem, 40*fem, 30*fem, 40*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(30*fem),
          ),
          child: Form(
            key: _formfield,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // titlesectionqsb (11:705)
                    margin: EdgeInsets.fromLTRB(80*fem, 0*fem, 81*fem, 30*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // heythere9dP (11:706)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                          child: Text(
                            'Hey there,',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xff1d1517),
                            ),
                          ),
                        ),
                        Text(
                          // welcomebackGLd (11:707)
                          'Welcome Back',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.5*ffem/fem,
                            color: Color(0xff1d1517),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // labelsectionZ4q (11:723)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 285*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // labelbgcRj (I11:214;379:3991)
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48*fem,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xfff7f8f8)),
                            color: Color(0xfff7f8f8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(

                            // placeholderFDo (I11:214;379:3993)
                            width: 89*fem,
                            height: double.infinity,
                            child: TextFormField(
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
                              ),

                              validator: (value){
                                bool emailVaild=RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                                if(value.isEmpty){
                                  return"Enter your Email";

                                }

                                if(!emailVaild ){
                                  return"Enter valid Email";
                                }
                              },
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,


                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          width: double.infinity,
                          height: 48*fem,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xfff7f8f8)),
                            color: Color(0xfff7f8f8),
                            borderRadius: BorderRadius.circular(14*fem),
                          ),
                          child: Container(
                              width: 89*fem,
                              height: double.infinity,
                              child: TextFormField(
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

                                validator:(value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter Password";
                                  }
                                  else if (_password.text.length<6){
                                    return "password length should be more than 6 characters";
                                  }
                                },
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                              )
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(

                    // buttonlogindAV (11:708)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                    width: double.infinity,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(99*fem),
                      gradient: LinearGradient (
                        begin: Alignment(1, 1),
                        end: Alignment(-1.479, -1.615),
                        colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x4c95adfe),
                          offset: Offset(0*fem, 10*fem),
                          blurRadius: 11*fem,
                        ),
                      ],
                    ),


                    child: GestureDetector(
                      onTap: () async{
                        if (_formfield.currentState!.validate()) {
                          print("Data Added Successfully");
                          setState(() {
                            try{
                              LogInMethod(_email.text.toString(),_password.text.toString());
                            }
                            catch(e){
                              print("My Error $e");
                            }

                          });
                          _email.clear();
                          _password.clear();
                        }

                      },

                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                       


                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.5*fem, 0*fem),
                              width: 19,
                              height: 20,
                              child: Image.asset(
                                'assets/iconly-bold-login.png',
                                width: 19*fem,
                                height: 20*fem,
                              ),

                            ),


                             Text(
                                'Login',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xffffffff),


                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),



                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Divider(color:Colors.black ,),
                        width:120,
                      ),
                      Text("  Or  "),
                      SizedBox(
                        child: Divider(color:Colors.black ,),
                        width:120,
                      ),
                    ],
                  ),),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width/1.4,
                    height:MediaQuery.of(context).size.height/25,
                    //color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account yet?" ,style:SafeGoogleFont (
                          'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black,
                        ), ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>register1()));
                        }, child: Text("Register",style: SafeGoogleFont (
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
