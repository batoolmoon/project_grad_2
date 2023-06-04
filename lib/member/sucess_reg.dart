import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:Fitnesscore/home/dash_bord.dart';
import 'dart:ui';
import '../utils.dart';

class SucessReg extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 80, 30, 40),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.56, 0, 0, 44),
                width: 277.56,
                height: 304,
                child: Image.asset(
                  'assets/group.png',
                  width: 277.56,
                  height: 304,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50.5, 0, 51.5, 130),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(1, 0, 0, 5),
                      child: Text(
                        'Welcome Our Friend',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff1d1517),
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints (
                        maxWidth: 213,
                      ),
                      child: Text(
                        'You are all set now, let’s reach your goals together with us',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBord()));
                },
                child: Container(
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
                        offset: Offset(0, 10),
                        blurRadius: 11,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Go To Home',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}