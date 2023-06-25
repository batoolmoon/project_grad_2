import 'dart:math';
import 'package:Fitnesscore/BMI/score_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../home/BottomNavBar.dart';
import 'age_weight_weight.dart';
import 'gender_widget.dart';
import 'height_widget.dart';


class bmiscreen extends StatefulWidget {
  const bmiscreen({Key? key}) : super(key: key);

  @override
  State<bmiscreen> createState() => _bmiscreenState();
}

class _bmiscreenState extends State<bmiscreen> {
  int _gender=0;
  int _height=150;
  int _age=30;
  int _weight=50;
  bool _isFinished=false;
  double _bmiScore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
        centerTitle: true,
        flexibleSpace:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient (
              begin: Alignment(1, 1),
              end: Alignment(-1.479, -1.615),
              colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
              stops: <double>[0, 1],
            ),
          ),
        ),
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
            ),
            padding: EdgeInsets.all(12),
            margin:EdgeInsets.only(top: 15) ,
            child:Card(
              elevation: 12,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 7,),
                  //select gender
                  GenderWidget(onChange: (genderVal){
                    _gender=genderVal;
                  },
                  ),
                  HeightWidget(onChange: (heightVal){
                       _height=heightVal;
                  },
                  ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  AgeWidgetWidget(onChange: (ageVal ) {
                    _age=ageVal;
                  }, title: "Age", initValue:30 , min: 18,max:75),

                    AgeWidgetWidget(onChange: (weightVal ) {
                      _weight=weightVal;
                    }, title: "Weight(Kg)", initValue:50 , min: 40,max:200)

                  ],),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                    child: SwipeableButtonView(isFinished: _isFinished,
                        onFinish: () async{
                      await Navigator.push(context,
                     PageTransition(child: ScoreScreen(
                       bmiscore: _bmiScore,
                       age: _age,
                     ), type: PageTransitionType.fade));
                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                      //calculator bmi
                          calculatorBmi();
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });

                        },
                        activeColor: Colors.blueAccent,
                        buttonWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText:"CALCULATE"),
                  ),

                ],

              ),

            )


          ),
        ),
      )
    );
  }
  void calculatorBmi(){
    _bmiScore=_weight/pow(_height/100,2);
  }
}
