import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Notification.dart';
import 'package:my_diet_guide/widgets/timePicker.dart';

import '../core/services/local_notification_service.dart';
import '../widgets/background_image.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  TimeOfDay _breakfastTime = TimeOfDay.now();
  TimeOfDay _lunchTime = TimeOfDay.now();
  TimeOfDay _dinnerTime = TimeOfDay.now();
  late NotificationService breakfastService;
  @override
  void initState() {
    super.initState();
    NotificationService.init();
    listenNotifications();
    //breakfast notification
     breakfastService = NotificationService(
      1,
      'Breakfast Time',
      'It\'s time to eat breakfast',
      'Eat breakfast',
    );
  }

  void listenNotifications() =>
      NotificationService.onNotification.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Notifications()));

  void _showTimePicker(TimeOfDay time){ //setting time according to the button pressed
    showTimePicker(context: context,
        initialTime: TimeOfDay.now())
        .then((value) => setState(() {
      if(_breakfastTime == time){
        _breakfastTime = value!;
      }
      else if(_lunchTime == time){
        _lunchTime = value!;
      }
      else if(_dinnerTime == time){
        _dinnerTime = value!;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Notifications',
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showTimePicker(_breakfastTime);
                      },
                      child: Text(
                        _breakfastTime.format(context).toString(),
                        style: TextStyle(color: Colors.white,
                        fontSize: 50),
                      ),
                    ),

                    SizedBox(width: 20,),

                    // LiteRollingSwitch(
                    //   value:true,
                    //   textOn: "On",
                    //   textOff: "Off",
                    //   colorOn: Colors.greenAccent,
                    //   colorOff: Colors.redAccent,
                    //   iconOn: Icons.done,
                    //   iconOff: Icons.remove_circle_outline,
                    //   textSize: 18,
                    //   onChanged: (bool position){
                    //     print("button is $position");
                    //   }, onTap: (){
                    //   print("button is tapped12345");
                    //   breakfastService.setNotification(_breakfastTime);
                    // }, onDoubleTap: (){
                    //
                    // },onSwipe: (){
                    //   print("swipe");
                    // },
                    // ),
                    // TimePicker(),
                    ElevatedButton(onPressed: () async{
                      NotificationService.showScheduledNotification(
                        id: 1,
                        title: 'Breakfast Time',
                        body: 'It\'s time to eat breakfast',
                        payload: 'Eat breakfast',
                          scheduledDate: TimeOfDay.now());
                    }, child: Text('Set Notification'))
                  ],
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
