import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:my_diet_guide/models/Notification.dart';

class LiteRollingSwitchDefined extends StatefulWidget {
  late NotificationService notificationService;
  late TimeOfDay time;
  late bool value;
  LiteRollingSwitchDefined({Key? key, required this.notificationService, required this.time, required this.value}) : super(key: key);

  @override
  State<LiteRollingSwitchDefined> createState() => _LiteRollingSwitchDefinedState();
}

class _LiteRollingSwitchDefinedState extends State<LiteRollingSwitchDefined> {
  @override
  Widget build(BuildContext context) {
    NotificationService notificationService = widget.notificationService;
    TimeOfDay time = widget.time;
    return   LiteRollingSwitch(
          value: widget.value,
          textOn: "On",
          textOff: "Off",
          colorOn: Colors.greenAccent,
          colorOff: Colors.redAccent,
          iconOn: Icons.done,
          iconOff: Icons.remove_circle_outline,
          textSize: 18,
          onChanged: (bool position){
            if(position){
              notificationService.setNotification(time);
              notificationService.setNotificationState(); //to switch on when the navigating to the notification page again
            }
            else{
              notificationService.cancelNotification();
              notificationService.removeNotificationState();
            }
          }, onTap: (){
        }, onDoubleTap: (){

        },onSwipe: (){
        },
    );
  }
}
