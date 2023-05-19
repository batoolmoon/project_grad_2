import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils.dart';


class dashbord3 extends StatefulWidget {
  const dashbord3({Key? key}) : super(key: key);

  @override
  _dashbord1State createState() => _dashbord1State();
}

class _dashbord1State extends State<dashbord3> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
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
                  width:width,
                  height: height/1.7,
                  child: Image.asset(
                    'assets/group-vCu.png',
                    width: 375,
                    height: 439,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 31, 30, 40),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 13, 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                              child: Text(
                                'Eat Well',
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
                                maxWidth: 302,
                              ),
                              child: Text(
                                'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
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
                          'assets/button.png',
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
