import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/BottomNavBar.dart';
import 'notification_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double opacity=0.5;//need edit
  static bool notification=false;
  bool absorbPointer=true;//need edit
  bool editAndSave=false;//false=edit true=save

    @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Profile" , style: TextStyle(color: Colors.white),),
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon:Icon(Icons.arrow_back),

        ),
      ),
      body: SafeArea(
        child:Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column (
                children: [
                  Container(
                    width: width/1.1,
                    height: height/1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient (
                        begin: Alignment(1, 1),
                        end: Alignment(-1.479, -1.615),
                        colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    //margin: EdgeInsets.fromLTRB(20, 60, 20, 80),
                    child: ListView(
                      children: [
                        AbsorbPointer(
                          absorbing:absorbPointer ,
                          child: Container(
                            width: width,
                            margin: EdgeInsets.fromLTRB(5, 10, 3, 5),
                            //color: Colors.purple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    //padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon:Icon(Icons.person , size: 25,color: Colors.purpleAccent,),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          )
                                      ),
                                    ),


                                  ),
                                ),
                                Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    //padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon:Icon(Icons.person , size: 25,color: Colors.purpleAccent,),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          )
                                      ),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: absorbPointer,
                          child: Opacity(
                            opacity: opacity,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              margin: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: width,
                              height: height/15,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon:Icon(Icons.email_outlined , size: 25,color: Colors.purpleAccent,),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),


                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: absorbPointer,
                          child: Opacity(
                            opacity: opacity,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              margin: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: width,
                              height: height/15,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon:Icon(Icons.password , size: 25,color: Colors.purpleAccent,),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),


                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: absorbPointer,

                          child: Container(
                            width: width,
                            //padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                            //color: Colors.purple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    //padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon:Icon(Icons.person , size: 25,color: Colors.purpleAccent,),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          )
                                      ),
                                    ),


                                  ),
                                ),
                                Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    //padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon:Icon(Icons.person , size: 25,color: Colors.purpleAccent,),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          )
                                      ),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: absorbPointer,

                          child: Opacity(
                            opacity: opacity,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              margin: EdgeInsets.fromLTRB(10, 10, 20, 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: width,
                              height: height/15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                  Icon(Icons.notifications_active , size: 25,color: Colors.purpleAccent,),
                                  SizedBox(width: 15,),
                                  Text("Notification"),
                                  SizedBox(width: 70,),
                                  Switch(value:notification ,
                                      onChanged:(value) {
                               notification=value;
                               showDialog(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return AlertDialog(
                                     title: Text("Allow Notification"),
                                     content: Text("Let the app send you a notification if\nyou do not open the app for 24 hours"),
                                     actions: <Widget>[
                                       TextButton(
                                         child: Text("Cancel"),
                                         onPressed: () {
                                           setState(() {
                                             notification=false;
                                           });
                                           Navigator.of(context).pop();
                                         },
                                       ),
                                       TextButton(
                                         child: Text("OK"),
                                         onPressed: () {
                                           setState(() {
                                             notification=true;
                                           });
                                           NotificationService().showNotification(title: "Iam batool",body: "Iam notification");
                                           Navigator.of(context).pop();
                                         },
                                       ),
                                     ],
                                   );

                                 },

                               );
                                   /* setState(() {
                                      notification=!notification;
                                    });*/
                                  })
                                ],
                              ),



                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          width: width/2.5,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.purpleAccent
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  editAndSave=!editAndSave;
                                  absorbPointer=!absorbPointer;
                                  editAndSave?opacity=1.0:opacity=0.5;
                                });

                              },
                              child: editAndSave?Text("Save",style:TextStyle(color: Colors.white,fontSize:15),):Text("Edit",style:TextStyle(color: Colors.white,fontSize:15),),
                              style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0.0,
                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
 SafeArea(
        child: Container(
          color: Colors.white,
          child:Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 150),
                decoration: BoxDecoration(
                    gradient: LinearGradient (
                      begin: Alignment(1, 1),
                      end: Alignment(-1.479, -1.615),
                      colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                      stops: <double>[0, 1],
                    ),
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )
                ),
                child:
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 70,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5.0,5.0),
                                  blurRadius: 5
                                )
                              ]

                            ),
                            child: TextFormField(
                              validator: ,
                              decoration: InputDecoration(
                                prefixIcon:Icon(Icons.person , size: 30,color: Colors.purpleAccent,),
                               border: OutlineInputBorder(
                             borderSide: BorderSide.none,
                                     )
                              ),

                             /* child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                  SizedBox(width: 15,),
                                  Text("Batoo Ashour")
                                ],
                              ),*/
                            ),
                          ),
                          SizedBox(height: height/30,),
                          Container(
                            width: 350,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(5.0,5.0),
                                      blurRadius: 5
                                  )
                                ]

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                Icon(Icons.mail , size: 30,color: Colors.purpleAccent,),
                                SizedBox(width: 15,),
                                Text("BatoolKaled8@outlook.com")
                              ],
                            ),
                          ),
                          SizedBox(height: height/30,),
                          Container(
                            width: 350,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(5.0,5.0),
                                      blurRadius: 5
                                  )
                                ]

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                Icon(Icons.line_weight_outlined , size: 30,color: Colors.purpleAccent,),
                                SizedBox(width: 15,),
                                Text("Your Last BMI = 50.2 ")
                              ],
                            ),
                          ),
                          SizedBox(height: height/30,),
                          Container(
                            width: 350,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(5.0,5.0),
                                      blurRadius: 5
                                  )
                                ]

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                Icon(Icons.notifications_active , size: 30,color: Colors.purpleAccent,),
                                SizedBox(width: 15,),
                                Text("Notification")
                              ],
                            ),
                          ),
                          SizedBox(height: height/30),
                          Container(
                            width: 350,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(5.0,5.0),
                                      blurRadius: 5
                                  )
                                ]

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                                Icon(Icons.logout , size: 30,color: Colors.purpleAccent,),
                                SizedBox(width: 15,),
                                Text("Log Out")
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),


              ),
              Positioned(
                left: 110,
                right:110 ,
                top:22,
                bottom:510,
                child: Container(
                  width: 30,
                  height: 130,
                  decoration: BoxDecoration(
                      //color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                   image: DecorationImage(
                       image: AssetImage("assets/group.png")
                   )
                  ),
                ),
              ),
            ],
          )



        ),
      ),
*/