import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:  EdgeInsets.fromLTRB(30, 351, 30, 41),
          width:  double.infinity,
          decoration:  BoxDecoration (
            color:  Color(0xffffffff),
            borderRadius:  BorderRadius.circular(40),
          ),
          child:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  margin:  EdgeInsets.fromLTRB(65, 0, 64, 264),
                  width:  double.infinity,
                  height:  97,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        left:  0,
                        top:  70,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  186,
                            height:  27,
                            child:
                            Text(
                              'Everybody Can Train',
                              style: TextStyle (
                                fontSize:  18,
                                fontWeight:  FontWeight.w400,
                                height:  1.5,
                                color:  Color(0xff7b6f72),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  11,
                        top:  0,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  156,
                            height:  75,
                            child:
                            RichText(
                              text:
                              TextSpan(
                                style:  TextStyle (
                                  fontSize:  36,
                                  fontWeight:  FontWeight.w700,
                                  height:  1.5,
                                  color:  Color(0xff1d1517),
                                ),
                                children:  [
                                  TextSpan(
                                    text:  'Fitnes',
                                    style:  TextStyle (
                                      fontSize:  36,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.5,
                                      color:  Color(0xff1d1517),
                                    ),
                                  ),
                                  TextSpan(
                                    text:  's',
                                  ),
                                  TextSpan(
                                    text:  'X',
                                    style:  TextStyle (
                                      fontSize:  50,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.5,
                                      color:  Color(0xff1d1517),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width:  double.infinity,
                  height:  60,
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(99),
                    gradient:  LinearGradient (
                      begin:  Alignment(1, 1),
                      end:  Alignment(-1.479, -1.615),
                      colors:  <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                      stops:  <double>[0, 1],
                    ),
                    boxShadow:  [
                      BoxShadow(
                        color:  Color(0x4c95adfe),
                        offset:  Offset(0 ,10),
                        blurRadius:  11,
                      ),
                    ],
                  ),
                  child:
                  Center(
                    child:
                    Text(
                      'Get Started',
                      style:  TextStyle (
                        fontSize:  16,
                        fontWeight:  FontWeight.w700,
                        height:  1.5,
                        color:  Color(0xffffffff),
                      ),
                    ),
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
