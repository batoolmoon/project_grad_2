import 'package:flutter/material.dart';

class AgeWidgetWidget extends StatefulWidget{
final Function(int) onChange;
final String title;
final int initValue;
final int min ;
final int max;
  const AgeWidgetWidget({Key? key,required this.onChange,required this.title,required this.initValue,required this.min,required this.max}) : super(key: key);

  @override
  State<AgeWidgetWidget> createState() => _AgeWidgetWidgetState();
}

class _AgeWidgetWidgetState extends State<AgeWidgetWidget> {
  int counter=0;
  void initState(){
    super.initState();
    counter=widget.initValue;
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 8,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
    child: Column(
    children: [
      Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.grey),
      ),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          InkWell(
            child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.purpleAccent,
          child: Icon(
            Icons.remove,
            color: Colors.white,
          ),

        ),
            onTap:(){
              setState(() {
                if (counter>widget.min)
                  counter--;
              }
              );
              widget.onChange(counter);
            },
          ),
          SizedBox(width: 15,),
          Text(counter.toString(),textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87,fontSize: 18,
          fontWeight: FontWeight.w500),),
          SizedBox(width: 15,),

          InkWell(
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.purpleAccent,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),

            ),
            onTap:(){
              setState(() {
                if (counter<widget.max)
                  counter++;
              }
              );
              widget.onChange(counter);
            },
          ),

        ],

    ),
      ),
      ]
    )
    )
    );
  }
}
