import 'package:Fitnesscore/BMI/bmiscreen.dart';
import 'package:Fitnesscore/steps_counter/steps.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

import '../food_recipes/foodRecipes.dart';
import '../user_profile/userprofile.dart';
import 'dash_bord.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int page =0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  CurvedNavigationBar(
        index: 2,
        key:_bottomNavigationKey ,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.calculate_outlined),
            label: 'BMI',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.do_not_step_outlined),
            label: 'Steps',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.home),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.fastfood_outlined),
            label: 'Recipes',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.purpleAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
          switch (index) {
            case 0: Navigator.push(context, MaterialPageRoute(builder: (context)=>bmiscreen())) ; index=0 ;break;
            case 1: Navigator.push(context, MaterialPageRoute(builder: (context)=>Steps()));break;
            case 2: Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBord()));break;
            case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=>food()));break;
            case 4: Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));break;

          }

        },
        letIndexChange: (index) => true,
      );

  }
}