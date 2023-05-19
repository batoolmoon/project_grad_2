import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
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
          leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:Icon(Icons.arrow_back),

          ),
      ),
      body: SafeArea(
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
    );
  }
}
