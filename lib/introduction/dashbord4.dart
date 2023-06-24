import 'package:Fitnesscore/member/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils.dart';

class dashbord4 extends StatefulWidget {
  const dashbord4({Key? key}) : super(key: key);

  @override
  _dashbord4State createState() => _dashbord4State();
}

class _dashbord4State extends State<dashbord4> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return
      Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height:double.infinity ,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(40),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height/1.79,
                  child: Image.asset(
                    'assets/frame-P97.png',
                    width: 375,
                    height: 422,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              constraints: BoxConstraints (
                                maxWidth: 177,
                              ),
                              child: Text(
                                'Improve Sleep  Quality',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints (
                                maxWidth: 300,
                              ),
                              child: Text(
                                'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40),
                         color: Colors.purpleAccent,
                       ),
                       child: ElevatedButton(
                         onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn2())); },
                         child: Text("Go to Log-in",style:TextStyle(color: Colors.white,fontSize:15),),
                           style:ElevatedButton.styleFrom(
                             backgroundColor: Colors.transparent,
                             elevation: 0.0
                           )
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
    );
  }
}
