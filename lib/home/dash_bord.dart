import 'package:Fitnesscore/food_recipes/foodRecipes.dart';
import 'package:Fitnesscore/member/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/user_profile/userprofile.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../meals_ML/TfliteModel.dart';
import 'BottomNavBar.dart';
import 'daily_track.dart';


class DashBord extends StatefulWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  String steps ="0.0";

  final DailyTrack dailyTrack = DailyTrack();
  @override

  void initState(){
    super.initState();

  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn2()));}
              , icon: Icon(Icons.logout))
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
        title: Text("Fitness Core" , style: TextStyle(color: Colors.white, fontSize: 20),),

      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient (
                      begin: Alignment(1, 1),
                      end: Alignment(-1.479, -1.615),
                      colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/frame-P97.png",width: 80,height: 80,),
                      SizedBox(width: 10,),
                      Text("The body achieves \nwhat the mind believes",style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 20),),
                    ],
                  ),
                ),
             DailyTrack(),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TfliteModel()));},
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage("https://d1dxs113ar9ebd.cloudfront.net/225batonrouge/2017/11/Screen-Shot-2017-11-21-at-9.51.15-AM.png"),
                            fit: BoxFit.cover),


                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2.0,2.0),
                                  blurRadius: 2
                              )
                            ]
                        ),
                        padding: EdgeInsets.fromLTRB(15, 2,15, 2),
                      ),
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: const Color(0xFF000000),
                            ),
                            margin: EdgeInsets.all(20),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height/7,

                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/4,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("CLICK HERE", style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 30)),
                          Text("AND", style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 50)),
                          Text("TAKE NEW EXPERIENCE WITH " , style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 20),),
                          Text("FOOD CALORIES DETECTION", style: TextStyle(fontWeight:FontWeight.w900, color: Colors.white ,fontSize: 20))
                            ],
                        ),
                      )
                    ],

                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
