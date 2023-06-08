import 'package:Fitnesscore/food_recipes/foodRecipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Fitnesscore/BMI/bmiscreen.dart';
import 'package:Fitnesscore/steps_counter/steps.dart';
import 'package:Fitnesscore/user_profile/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNavBar.dart';
import 'card.dart';
import '../meals_ML/TfliteModel.dart';

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
     steps=prefs.getString("steps")!;
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
                 /*  //Image.network("https://m.media-amazon.com/images/I/61UhsQE5xOL.png",
                   width: 100,
                   height: 120,),*/
                 Column(
                   children: [
                     Text("Water"),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       ElevatedButton(onPressed: (){waterValue=0.25;}, child: Text("250 ML"),
                         style:ElevatedButton.styleFrom(
                           backgroundColor: Colors.purpleAccent
                         ) ,),
                      SizedBox(width: 4,),
                       ElevatedButton(onPressed: (){waterValue=0.5;}, child: Text("500 ML"),
                         style:ElevatedButton.styleFrom(
                             backgroundColor: Colors.purpleAccent
                         ) ,),
                         SizedBox(width: 4,),
                         ElevatedButton(onPressed: (){waterValue=0.9;}, child: Text(" 1 L"),
                           style:ElevatedButton.styleFrom(
                               backgroundColor: Colors.purpleAccent
                           ) ,)
                     ],)
                   ],
                 )
                 ],
               ),
                ),
               /* Container(
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
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>food()));},
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
                                margin: EdgeInsets.fromLTRB(20, 0, 20, 10)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
