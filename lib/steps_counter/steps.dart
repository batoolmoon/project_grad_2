import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', steps = '?';
  double _km=0.0 , _calories=0.0;


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    // walking, stopped or unknown.
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      //steps = 'Step Count not available';
      steps="0";
    });
  }

  double stepsToKilometres(){
    setState(() {
      _km=double.parse(steps) / 1312.33595801;
    });
    return _km;
  }

  double caloriesCount(){
    setState(() {
      // 0.04 calories per step
      _calories=double.parse(steps)*0.04;

    });
    return _calories;
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Steps And Body Fit"),
          leading: IconButton(onPressed: () { Navigator.pop(context); },
            icon: Icon(Icons.arrow_back),),
          centerTitle: true,
          flexibleSpace:Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient (
                begin: Alignment(1, 1),
                end: Alignment(-1.479, -1.615),
                colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                stops: <double>[0, 1],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                margin: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient (
                      begin: Alignment(1, 1),
                      end: Alignment(-1.479, -1.615),
                      colors: <Color>[Color(0xffc58bf2), Color(0xffeea4ce)],
                      stops: <double>[0, 1],
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5.0,5.0),
                          blurRadius: 5,
                          color: Colors.grey
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Steps taken',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          steps,
                          style: TextStyle(fontSize: 40,color:Colors.white),
                        ),
                      ],
                    ),
                     CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      percent:double.parse(steps)/10000 ,
                      center: new Icon(
                        Icons.directions_walk,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.white,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40,),

              Container(
                height:300,
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                margin: EdgeInsets.only(left: 15,right: 15),
                //color: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5.0,5.0),
                                blurRadius: 5,
                                color: Colors.grey
                            )
                          ]
                      ),
                      width: 140,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          "${caloriesCount()}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5.0,5.0),
                              blurRadius: 5,
                              color: Colors.grey
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),

                      width: 140,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          "${stepsToKilometres()}",
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ),
                    )
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}


class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  double _km=0.0 , _calories=0.0;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();

  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  String onPedestrianStatusChanged(PedestrianStatus event) {
    // walking, stopped or unknown.
    print(event);
    setState(() {
      _status = event.status;
    });
    return _status;
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  double stepsToKilometres(){
    setState(() {
      _km=double.parse(_steps) / 1312.33595801;
    });
    return _km;
  }

  double caloriesCount(){
    setState(() {
      // 0.04 calories per step
      _calories=double.parse(_steps)*0.04;

    });
    return _calories;
  }


  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Step Counter'),
          actions: [
            Icon(Icons.arrow_forward)
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                margin: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5.0,5.0),
                          blurRadius: 5,
                          color: Colors.grey
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Steps taken',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          _steps,
                          style: TextStyle(fontSize: 40,color:Colors.white),
                        ),
                      ],
                    ),
                    new CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      percent:double.parse(_steps)/10000 ,
                      center: new Icon(
                        Icons.directions_walk,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.white,
                    ),

                  ],
                ),
              ),

              SizedBox(height: 40,),

              Container(
                height:300,
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                margin: EdgeInsets.only(left: 15,right: 15),
                //color: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5.0,5.0),
                                blurRadius: 5,
                                color: Colors.grey
                            )
                          ]
                      ),

                      width: 140,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          caloriesCount().toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5.0,5.0),
                              blurRadius: 5,
                              color: Colors.grey
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),

                      width: 140,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          stepsToKilometres().toStringAsFixed(3),
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ),
                    )
                  ],

                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

*/
