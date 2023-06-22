import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/member/sucess_reg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import '../utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class register2 extends StatefulWidget {
  register2(this.email, this.password, this.firstName, this.lastName,
      {Key? key})
      : super(key: key);
  String email;
  String password;
  String firstName;
  String lastName;



  @override
  _register2State createState() =>
      _register2State(email, password, firstName, lastName);
}

class _register2State extends State<register2> {
  //constructor
  _register2State(this.email, this.password, this.firstName, this.lastName);
  String email;
  String password;
  String firstName;
  String lastName;
  // to save data into firebase database table
  ////////////////////////////////////////////
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  String gender = "Male";
  bool male = true, female = false;
  late double _bmiScore;



  void calculatorBmi(wt,ht){
    _bmiScore=double.parse(wt)/pow(double.parse(ht)/100,2);
    getSharedData();
  }

  getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble("bmiScore", _bmiScore);
    });
  }

/*// Register user with Firebase
  void _registerUser() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

     Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBord()));
    } on FirebaseAuthException catch (e) {
      // Registration failed, handle the error
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error: ${e.code}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }*/


  // Register a new user with Firebase Authentication
  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("llllll");

      // User registered successfully, proceed to save additional details to Firestore
      await saveUserData(userCredential.user!.uid, email);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SucessReg()));
    } catch (e) {
      print('Error registering user: $e');
      // Handle error (e.g., display an error message to the user)
    }
  }

// Save user details to Firestore
  Future<void> saveUserData(String userId, String email) async {
    try {
      await FirebaseFirestore.instance.collection("fitnesscore_users").doc(userId).set({
        "age":age.text.toString(),
        "email":email,
        "firstname":firstName,
        "gender":gender.toString(),
        "hight":height.text.toString(),
        "lastname":lastName,
        "password":password,
        "weight":weight.text.toString()
      });
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            //color: Colors.lightBlue,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.grey,
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    width: 375,
                    height: 270,
                    child: Image.asset(
                      'assets/vector-section.png',
                      width: 375,
                      height: 350,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(52, 0, 70, 0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Let’s complete your profile',
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Color(0xff1d1517),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                          child: Text(
                            'It will help us to know more about you!',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Color(0xff7b6f72),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // color: Colors.orange,
                    margin: EdgeInsets.fromLTRB(25, 0, 50, 0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 48,
                          //color: Colors.green,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: male
                                          ? LinearGradient(
                                        begin: Alignment(1, 1),
                                        end: Alignment(-1.479, -1.615),
                                        colors: <Color>[
                                          Color(0xff92a3fd),
                                          Color(0xff9dceff)
                                        ],
                                        stops: <double>[0, 1],
                                      )
                                          : LinearGradient(colors: [
                                        Color(0xffaca4a5),
                                        Color(0xffaca4a5),
                                        Color(0xffaca4a5)
                                      ]),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          male = true;
                                          female = false;
                                        });
                                      },
                                      child: Text("Male"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0),
                                    ),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: female
                                          ? LinearGradient(
                                        begin: Alignment(1, 1),
                                        end: Alignment(-1.479, -1.615),
                                        colors: <Color>[
                                          Color(0xff92a3fd),
                                          Color(0xff9dceff)
                                        ],
                                        stops: <double>[0, 1],
                                      )
                                          : LinearGradient(colors: [
                                        Color(0xffaca4a5),
                                        Color(0xffaca4a5),
                                        Color(0xffaca4a5)
                                      ]),
                                    ),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            male = false;
                                            female = true;
                                          });
                                        },
                                        child: Text("Female"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0.0)),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xfff7f8f8),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextFormField(
                            controller: age,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: "Your Age",
                                hintStyle: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  color: Color(0xffaca4a5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Age";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                width: 225,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff7f8f8),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Container(
                                    width: 100,
                                    height: double.infinity,
                                    child: TextFormField(
                                      controller: weight,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          hintText: "Your Weight",
                                          hintStyle: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xffaca4a5),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                          prefixIcon: Icon(
                                              Icons.monitor_weight_outlined)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Your Weight";
                                        }
                                      },
                                    )),
                              ),
                              Container(
                                width: 50,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: LinearGradient(
                                    begin: Alignment(1, 1),
                                    end: Alignment(-1.479, -1.615),
                                    colors: <Color>[
                                      Color(0xffc58bf2),
                                      Color(0xffeea4ce)
                                    ],
                                    stops: <double>[0, 1],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'KG',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                width: 225,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff7f8f8),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  child: TextFormField(
                                    controller: height,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        hintText: "Your Height",
                                        hintStyle: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          color: Color(0xffaca4a5),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.swap_vert,
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Your Height";
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: LinearGradient(
                                    begin: Alignment(1, 1),
                                    end: Alignment(-1.479, -1.615),
                                    colors: <Color>[
                                      Color(0xffc58bf2),
                                      Color(0xffeea4ce)
                                    ],
                                    stops: <double>[0, 1],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'CM',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async{
                            calculatorBmi(weight.text,height.text);
                            setState(() {
                              try{
                                registerUser(email,password);
                              }
                              catch(e){print(" my erorr $e");}
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              gradient: LinearGradient(
                                begin: Alignment(1, 1),
                                end: Alignment(-1.479, -1.615),
                                colors: <Color>[
                                  Color(0xff92a3fd),
                                  Color(0xff9dceff)
                                ],
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
                                style: SafeGoogleFont(
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
