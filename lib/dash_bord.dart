import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/BMI/bmiscreen.dart';
import 'package:Fitnesscore/steps_counter/steps.dart';
import 'package:Fitnesscore/user_profile/userprofile.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'meals_ML/TfliteModel.dart';

class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));}
              , icon: Icon(Icons.person))
        ],
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
        title: Text("Home" , style: TextStyle(color: Colors.white, fontSize: 20),),

      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/4.5,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.purple,
                        child:CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 10.0,
                          percent:0.2,//double.parse(steps)/10000 ,
                          center:  Icon(
                            Icons.directions_walk,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.grey,
                          progressColor: Colors.white,
                        ),
                      ),
                       Container(
                         child: CircularPercentIndicator(
                           radius: 50.0,
                           lineWidth: 10.0,
                           percent:0.2,//double.parse(steps)/10000 ,
                           center: Icon(
                             Icons.fastfood_outlined,
                             size: 50.0,
                             color: Colors.white,
                           ),
                           backgroundColor: Colors.grey,
                           progressColor: Colors.white,
                         ),
                       ),
                      Container(
                        child:  CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 10.0,
                          percent:0.2,//double.parse(steps)/10000 ,
                          center: new Icon(
                            Icons.directions_walk,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.grey,
                          progressColor: Colors.white,
                        ),
                      )



                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient (
                        begin: Alignment(1, 1),
                        end: Alignment(-1.479, -1.615),
                        colors: <Color>[Color(0xffc58bf2), Color(0xffeea4ce)],
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
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TfliteModel()));},
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: MediaQuery.of(context).size.width/3,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient (
                                  begin: Alignment(1, 1),
                                  end: Alignment(-1.479, -1.615),
                                  colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                                  stops: <double>[0, 1],
                                ),
                              ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),),
                          ),
                          SizedBox(height:10 ,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>bmiscreen()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: MediaQuery.of(context).size.width/3,
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image:AssetImage("assets/bmi.png")),
                                  gradient: LinearGradient (
                                    begin: Alignment(1, 1),
                                    end: Alignment(-1.479, -1.615),
                                    colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                                    stops: <double>[0, 1],
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                             // child: Text("Bmi"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Steps()));},
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: MediaQuery.of(context).size.width/3,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient (
                                    begin: Alignment(1, 1),
                                    end: Alignment(-1.479, -1.615),
                                    colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                                    stops: <double>[0, 1],
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Text("step"),),
                          ),
                          SizedBox(height:10 ,),
                          Container(
                            width: MediaQuery.of(context).size.width/3.5,
                            height: MediaQuery.of(context).size.width/3,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient (
                                  begin: Alignment(1, 1),
                                  end: Alignment(-1.479, -1.615),
                                  colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                                  stops: <double>[0, 1],
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 10)),
                        ],
                      )
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
