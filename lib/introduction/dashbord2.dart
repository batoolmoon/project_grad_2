import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils.dart';


class dashbord2 extends StatefulWidget {
  const dashbord2({Key? key}) : super(key: key);

  @override
  _dashbord2State createState() => _dashbord2State();
}

class _dashbord2State extends State<dashbord2> {
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
                  width: width,
                  height: height/1.85,
                  child: Image.asset(
                    'assets/frame-iGD.png',
                    width: 375,
                    height: 406,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 64, 29, 40),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                              child: Text(
                                'Get Burn',
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
                                maxWidth: 316,
                              ),
                              child: Text(
                                'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
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
                        margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          'assets/button-6fo.png',
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
