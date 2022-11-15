import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}



class _TimePickerState extends State<TimePicker> {
  TimeOfDay _time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: showTimePicker(context: context, initialTime: TimeOfDay(hour: 12, minute: 12))
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _showTimePicker();
            },
            child: Text(
              _time.format(context).toString(),
              style: TextStyle(color: Colors.white,
                  fontSize: 50),
            ),
          ),

          SizedBox(width: 20,),

          LiteRollingSwitch(
            value:true,
            textOn: "On",
            textOff: "Off",
            colorOn: Colors.greenAccent,
            colorOff: Colors.redAccent,
            iconOn: Icons.done,
            iconOff: Icons.remove_circle_outline,
            textSize: 18,
            onChanged: (bool position){
              print("button is $position");
            }, onTap: (){
            print("button is tapped");
          }, onDoubleTap: (){

          },onSwipe: (){
            print("swipe");
          },
          ),
        ],
      ),
    );
  }
  void _showTimePicker(){
    showTimePicker(context: context,
        initialTime: TimeOfDay.now())
        .then((value) => setState(() {
      _time = value!;
    }));
  }
}


