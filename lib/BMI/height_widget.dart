import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 8,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
      child: Column(
        children: [
          Text("Height",style: TextStyle(fontSize: 20,color: Colors.grey ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_height.toString(),style: TextStyle(fontSize: 40),),
              SizedBox(width: 10,),
              Text("cm",style: TextStyle(fontSize: 20,color: Colors.grey),
              )
            ],
          ),
          Slider(min: 0, max: 210.0,value: _height.toDouble(),
          thumbColor: Colors.red,
          onChanged: (value){
            setState(() {
              _height=value.toInt();
            });
            widget.onChange(_height);
          },)
   ],
      )),
    );
  }
}
