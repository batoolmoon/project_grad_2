import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Fitnesscore/BMI/bmiscreen.dart';
import 'package:Fitnesscore/member/register_1.dart';
import 'package:Fitnesscore/steps_counter/steps.dart';
import 'package:Fitnesscore/user_profile/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home/dash_bord.dart';
import 'introduction/intro_slider.dart';
import 'member/login.dart';
import 'member/register_2.dart';
import 'member/sucess_reg.dart';
import 'member/register_1.dart';
import 'introduction/welcome_screen.dart';

void main() async{

  runApp(const MyApp());
  await Firebase.initializeApp(); //inital app to get and send data to fire baser
  WidgetsFlutterBinding.ensureInitialized();//to handel folders to fire base
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
    );
  }
}



