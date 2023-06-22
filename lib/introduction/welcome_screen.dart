import 'dart:async';
import 'package:Fitnesscore/introduction/dashbord1.dart';
import 'package:flutter/material.dart';
import 'intro_slider.dart';

class Welcome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }

}



class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  late final Animation<double> _animation;

  late TextAlign theAlignment;
  late String welcomeTitle;
  bool isLoading = true;



  late Timer _timer;
  int _start = 3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    startTimer();

  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }



  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
            if(_start == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>dashbord1()));
            }
            if(_start == 1){
              _controller.forward();
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient (
                  begin: Alignment(1, 1),
                  end: Alignment(-1.479, -1.615),
                  colors: <Color>[Color(0xff92a3fd), Color(0xff9dceff)],
                  stops: <double>[0, 1],
                ),
              ),),
            Center(
              child: FadeTransition(
                opacity:_animation ,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/intro.png',
                      width: 250.0,
                    )
                ),
              ),
            ),

          ],
        )
    );
  }
}