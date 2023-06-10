import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DailyTrack extends StatefulWidget {
  const DailyTrack({Key? key}) : super(key: key);

  @override
  _DailyTrackState createState() => _DailyTrackState();
}

class _DailyTrackState extends State<DailyTrack> {
  String Steps="";
  late double Water=0;
  String Calories="";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedData();
  }

//inorder to track
  getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
     // Steps= prefs.getString("steps")!;
      Water=prefs.getDouble( "water")!;
    });
  }
  Widget _circleProgress() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: 0.7,
              backgroundColor: Color.fromRGBO(248, 250, 252, 1).withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation < Color > (Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(248, 250, 252, 1).withOpacity(0.2), width: 8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(248, 250, 252, 1).withOpacity(0.1),
                ),
                child: Container(
                  margin: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remaining',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '1,112',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'kcal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _macronutrients() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _macronutrientsTile(title: 'Steps', percentValue: 0.4, amountInGram: '10000 steps/day'),
          _macronutrientsTile(title: 'Fat', percentValue: 0.2, amountInGram: '14/85g'),
          _macronutrientsTile(title: 'Water', percentValue: Water/10, amountInGram: '4 cups/day')

        ]
    );
  }


  Widget _macronutrientsTile({
    String ? title,
    double ? percentValue,
    String ? amountInGram
  }) {
    return SizedBox(
      height: 50,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          LinearPercentIndicator(
            width: 120,
            animation: true,
            lineHeight: 6,
            animationDuration: 2500,
            percent: percentValue!,
            barRadius: Radius.circular(3),
            progressColor: Colors.white,
            padding: EdgeInsets.zero,
            backgroundColor: Color.fromRGBO(248, 250, 252, 1).withOpacity(0.2),
          ),
          Text(
            amountInGram!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        margin:EdgeInsets.fromLTRB(18, 20, 18,0) ,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient (
            begin: Alignment(1, 1),
            end: Alignment(-1.479, -1.615),
            colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
            stops: <double>[0, 1],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleProgress(),
            _macronutrients()

          ],
        ),
      ),
    );
  }

}
