import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiscore;
  final int age ;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;
   ScoreScreen({Key? key,required this.bmiscore,required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiIntepretation();
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        title: Text("BMI Score"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
    child:Card(
    elevation: 12,
    shape:RoundedRectangleBorder(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Your Score",style: TextStyle(fontSize: 30,color: Colors.blue),
      ),
        SizedBox(height: 10,),
        PrettyGauge(
          gaugeSize:300,
           minValue:0,
            maxValue:40,
            segments:[
              GaugeSegment("UnderWeight", 18.5,Colors.red),
              GaugeSegment("Normal", 6.4,Colors.green),
              GaugeSegment("OverWeight", 5,Colors.orange),
              GaugeSegment("Obese", 10.1,Colors.pink),
            ],
            valueWidget:Text(bmiscore.toStringAsFixed(1),
      style: TextStyle(fontSize: 40),
    ),
          currentValue: bmiscore.toDouble(),
          needleColor: Colors.blue,
          ),
      SizedBox(height: 10,),
      Text(bmiStatus!,
        style: TextStyle(fontSize: 20,color: bmiStatusColor!),),
      SizedBox(height: 10,),
      Text(bmiInterpretation!,
        style: TextStyle(fontSize: 15),),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent
            ),
            onPressed: (){
          Navigator.pop(context);
        },
            child: Text("Re-calculate")),
        SizedBox(width: 10,),
      /*  ElevatedButton(onPressed: (){
         // Share.share("Your BMI is ${bmiscore.toStringAsFixed(1)}at age ${age}");
        }, child: Text("Share")),*/
      ],)
    ]))),
    );
  }
  void setBmiIntepretation(){

    if(bmiscore>30){
      bmiStatus="Obese";
    bmiInterpretation="Please work to reduce obesity";
    bmiStatusColor=Colors.pink;
    }

    else if(bmiscore >= 25){
  bmiStatus="OverWeight";
  bmiInterpretation="Do regular exercise & reduce the weight";
  bmiStatusColor=Colors.orange;
  }
    else if(bmiscore >= 18.5){
      bmiStatus="Noraml";
      bmiInterpretation="Enjoy, You are fit";
      bmiStatusColor=Colors.green;
    }
    else if(bmiscore <18.5){
      bmiStatus="UnderWeight";
      bmiInterpretation="Try to increase the weight";
      bmiStatusColor=Colors.red;
    }
  }
}
