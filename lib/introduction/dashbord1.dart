import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils.dart';
class dashbord1 extends StatefulWidget {
  const dashbord1({Key? key}) : super(key: key);

  @override
  _dashbord1State createState() => _dashbord1State();
}

class _dashbord1State extends State<dashbord1> {
  @override
  Widget build(BuildContext context) {
double width=MediaQuery.of(context).size.width;
double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height/2.11,
                  child: Image.asset(
                    'assets/frame.png',
                    width: width,
                    height: height,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 109, 30, 30),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 3, 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                              child: Text(
                                'Track Your Goal',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xff1d1517),
                                ),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints (
                                maxWidth: 312,
                              ),
                              child: Text(
                                'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
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
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          'assets/button-z8D.png',
                          width: 60,
                          height: 60,
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
