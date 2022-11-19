import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Notification.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/liteRollingSwitch.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';
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
  late TimeOfDay _breakfastTime;
  late TimeOfDay _lunchTime;
  late TimeOfDay _dinnerTime;

  late NotificationService breakfastService;
  late NotificationService lunchService;
  late NotificationService dinnerService;

  @override
  void initState() {
    super.initState();
    // listenNotifications();
    //breakfast notification
     breakfastService = NotificationService.breakfastService;
     _breakfastTime = breakfastService.time;
    //lunch notification
    lunchService = NotificationService.lunchService;
    _lunchTime = lunchService.time;
    //dinner notification
    dinnerService = NotificationService.dinnerService;
    _dinnerTime = dinnerService.time;
  }

  // void listenNotifications() =>
  //     breakfastService.onNotification.stream.listen(onClickedNotification);
  //
  // void onClickedNotification(String? payload) =>
  //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => Notifications()));

  void _showTimePicker(String time){ //setting time according to the button pressed

    if(time == "breakfastTime"){
      showTimePicker(context: context, initialTime: _breakfastTime).
        then((value) => setState(() {
          _breakfastTime = value!;
          breakfastService.time = _breakfastTime;
        }));
    }
    else if(time == "lunchTime"){
      showTimePicker(context: context, initialTime: _lunchTime).
        then((value) => setState(() {
          _lunchTime = value!;
          lunchService.time = _lunchTime;
        }));
    }
    else if(time == "dinnerTime"){
      showTimePicker(context: context, initialTime: _dinnerTime).
        then((value) => setState(() {
          _dinnerTime = value!;
          dinnerService.time = _dinnerTime;
        }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlurredBackground(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 150,),
              //breakfast notification
              Row(
                children: [
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text("set breakfast time",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //breakfast time
                GestureDetector(
                  onTap: () {
                    _showTimePicker("breakfastTime");
                  },
                  child: Text(
                    _breakfastTime.format(context).toString(),
                    style: TextStyle(color: Colors.white,
                    fontSize: 50),
                  ),
                ),

                SizedBox(width: 20,),
                (breakfastService.notificationState)?
                LiteRollingSwitchDefined(notificationService: breakfastService, time: _breakfastTime, value: true,)
                    : LiteRollingSwitchDefined(notificationService: breakfastService, time: _breakfastTime, value: false,),
              ],
            ),

              SizedBox(height: 50,),

              //lunch notification
              Row(
                children: [
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text("set lunch time",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //breakfast time
                  GestureDetector(
                    onTap: () {
                      _showTimePicker("lunchTime");
                    },
                    child: Text(
                      _lunchTime.format(context).toString(),
                      style: TextStyle(color: Colors.white,
                          fontSize: 50),
                    ),
                  ),

                  SizedBox(width: 20,),

                  (lunchService.notificationState)?
                  LiteRollingSwitchDefined(notificationService: lunchService, time: _lunchTime, value: true,)
                      : LiteRollingSwitchDefined(notificationService: lunchService, time: _lunchTime, value: false,),
                ],
              ),

              SizedBox(height: 50,),

              //dinner notification
              Row(
                children: [
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text("set dinner time",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //breakfast time
                  GestureDetector(
                    onTap: () {
                      _showTimePicker("dinnerTime");
                    },
                    child: Text(
                      _dinnerTime.format(context).toString(),
                      style: TextStyle(color: Colors.white,
                          fontSize: 50),
                    ),
                  ),

                  SizedBox(width: 20,),

                  (dinnerService.notificationState)?
                  LiteRollingSwitchDefined(notificationService: dinnerService, time: _dinnerTime, value: true,)
                      : LiteRollingSwitchDefined(notificationService: dinnerService, time: _dinnerTime, value: false,),
                ],
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomBar(user_id: FirebaseAuth.instance.currentUser!.uid),
        ),
    ]);
  }
}
