import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/introduction/dashbord1.dart';
import 'package:Fitnesscore/introduction/dashbord2.dart';
import 'package:Fitnesscore/introduction/dashbord3.dart';
import 'package:Fitnesscore/introduction/dashbord4.dart';
class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: PageView(
            children: [
              dashbord1(),
              dashbord2(),
              dashbord3(),
              dashbord4(),
            ],
          ),
        ),
      ),
    );
  }
}
