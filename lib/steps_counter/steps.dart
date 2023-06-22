import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/BottomNavBar.dart';

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
  double _km=0.0 , caloriesBur=0.0;
  double waterValue=0;


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

  //inorder to track
  getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("steps", steps);
      prefs.setDouble("water", waterValue);
      prefs.setDouble("caloriesBurn", caloriesBur);
      print("waterValue $waterValue");
    });
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
      caloriesBur=double.parse(steps)*0.04;

    });
    return caloriesBur;
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
        bottomNavigationBar: BottomNavBar(),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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



              Container(
                height:200,
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
                      height: MediaQuery.of(context).size.height/4,
                      child: Center(
                        child: Column(
                          children: [
                       Image.network(
                           "https://icon-library.com/images/burn-calories-icon/burn-calories-icon-14.jpg",
                       width: 80,
                       height:80,),
                            SizedBox(height: 10,),
                            Text(
                              "${caloriesCount().toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
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
                      height: MediaQuery.of(context).size.height/4,
                      child: Center(
                        child: Column(

                          children: [
                            Image.network("https://cdn4.iconfinder.com/data/icons/baby-business/512/Yellow9-512.png",
                              width: 80,
                              height:80,),
                            SizedBox(height: 10,),
                            Text(
                              "${stepsToKilometres().toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/7,
                      decoration: BoxDecoration(
                          gradient: LinearGradient (
                            begin: Alignment(1, 1),
                            end: Alignment(-1.479, -1.615),
                            colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                            stops: <double>[0, 1],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5.0,5.0),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/water.png",
                            width: 80,
                            height: 100,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("TAKEN WATER" , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      waterValue+=0.25;
                                      getSharedData();
                                    });
                                  }, child: Text("250 ML"),
                                    style:ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purpleAccent
                                    ) ,),
                                  SizedBox(width: 4,),
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      waterValue+=0.5;
                                      getSharedData();
                                    });
                                  }, child: Text("500 ML"),
                                    style:ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purpleAccent
                                    ) ,),
                                  SizedBox(width: 4,),
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      waterValue+=0.99;
                                      getSharedData();


                                    });
                                  }, child: Text(" 1 L"),
                                    style:ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purpleAccent
                                    ) ,)

                                ],)
                            ],
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





