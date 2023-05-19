import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender=0;
  final ChoiceChip3DStyle unselect=ChoiceChip3DStyle(
  topColor:Colors.grey[200]!,
  backColor:Colors.grey,
  borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender==1? unselect:unselect,
            onSelected: (){
              setState(() {
                _gender=1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: (){
            },
            selected: _gender==1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("assets/man.png", width:50,height: 50,),
                SizedBox(height: 5,),
                Text("Male")
              ],
            )
        ),
        SizedBox(width: 20,),
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender==2? unselect:unselect,
            onSelected: (){
              setState(() {
                _gender=2;
              });
              widget.onChange(_gender);
            },
            selected: _gender==2,
            onUnSelected: (){},

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/woman.png", width:50,height: 50,),
                SizedBox(height: 5,),
                Text("Female")
              ],
            )
        )

      ],
    );

  }
}

