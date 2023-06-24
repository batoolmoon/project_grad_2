import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  late String Email="";
  String Password="";
  String FirstName="";
  String LastName="";
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController  _lastName = TextEditingController();

   getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print("uid $uid");
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('fitnessCore').doc("qjPoYD5gjNxtV9lErjvu").get();
    print(Email);
    if(doc.exists) { // this will check availability of document
     print("ok data ");
     print(doc);
    }else{
     print("no data");
    }
    setState((){});
  }

  getSharedDataGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      _email.text= prefs.getString("email")!;
      _password.text=prefs.getString("password")!;
      _firstName.text=prefs.getString("firstName")!;
      _lastName.text=prefs.getString("lastName")!;
    });
  }

  void updateData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentRef = FirebaseFirestore.instance.collection("fitnessCore").doc('qjPoYD5gjNxtV9lErjvu');
    await documentRef.update({
      'email': _email.text,
      "password": _password.text,
      'firstName': _firstName.text,
      'lastName':_lastName.text
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedDataGet();
    getUserDetails();
  }

  getSharedDataSet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("email", _email.text);
      prefs.setString("password", _password.text);
      prefs.setString("firstName", _firstName.text);
      prefs.setString("lastName", _lastName.text);
    });
  }

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
                    child: ListView(
                      children: [
                        AbsorbPointer(
                          absorbing:absorbPointer ,
                          child: Container(
                            width: width,
                            margin: EdgeInsets.fromLTRB(5, 10, 3, 5),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      controller: _firstName,
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
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    width: width/2.5,
                                    height: height/15,
                                    child: TextFormField(
                                      controller: _lastName,
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
                                controller: _email,
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
                                controller: _password,
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
                                getSharedDataSet();
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
