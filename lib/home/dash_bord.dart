import 'package:Fitnesscore/food_recipes/foodRecipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/user_profile/userprofile.dart';
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
  double waterValue=0;
  @override

  void initState(){
    super.initState();
    getSharedData();
  }

  getSharedData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

   setState(() {
     prefs.setDouble("water", waterValue);
   });
}


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
                DailyTrack(),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TfliteModel()));},
                  child: Container(
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
                              color: Colors.black12,
                              offset: Offset(2.0,2.0),
                              blurRadius: 2
                          )
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(15, 2,15, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("CLICK HERE", style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 30)),
                        Text("AND", style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 50)),
                        Text("TAKE NEW EXPERIENCE WITH " , style: TextStyle(fontWeight:FontWeight.w900 , color: Colors.white ,fontSize: 20),),
                        Text("FOOD CALORIES CALSSIFICATION", style: TextStyle(fontWeight:FontWeight.w900, color: Colors.white ,fontSize: 20))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                   width: 100,
                   height: 120,),
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
                           waterValue=0.25;
                         });
                         }, child: Text("250 ML"),
                         style:ElevatedButton.styleFrom(
                           backgroundColor: Colors.purpleAccent
                         ) ,),
                      SizedBox(width: 4,),
                       ElevatedButton(onPressed: (){
                         setState(() {
                           waterValue=0.5;
                         });
                         }, child: Text("500 ML"),
                         style:ElevatedButton.styleFrom(
                             backgroundColor: Colors.purpleAccent
                         ) ,),
                         SizedBox(width: 4,),
                         ElevatedButton(onPressed: (){
                           setState(() {
                             waterValue=0.9;
                             getSharedData();
                             DailyTrack();
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
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
