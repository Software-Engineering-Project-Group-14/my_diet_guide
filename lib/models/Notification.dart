import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// This class is used to schedule notifications
/// For breakfast notification id =1
/// For lunch notification id =2
/// For dinner notification id =3

class NotificationService{
  final _notifications = FlutterLocalNotificationsPlugin();
  final onNotification = BehaviorSubject<String?>();
  late bool notificationState;
  static NotificationService breakfastService = NotificationService(1, "Breakfast Time", "It's time to have breakfast", "Breakfast");
  static NotificationService lunchService = NotificationService(2, "Lunch time", "It's time to have lunch", "Lunch");
  static NotificationService dinnerService = NotificationService(3, "Dinner time", "It's time to have dinner", "Dinner");

  static TimeOfDay breakfastTime = TimeOfDay.now();
  static TimeOfDay lunchTime = TimeOfDay.now();
  static TimeOfDay dinnerTime = TimeOfDay.now();

  late int id;
  late String title;
  late String body;
  late String payload;
  late TimeOfDay time;
  NotificationService(this.id, this.title, this.body, this.payload){
    init();
    removeNotificationState();
    time = TimeOfDay.now();
  }

   void setNotificationState(){
    notificationState = true;
  }
   void removeNotificationState(){
    notificationState = false;
  }

  void setNotification(TimeOfDay time){
    this.time = time;
    showScheduledNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
        scheduledDate: time);
  }
   Future init({bool initScheduled = false}) async{
    _configureLocalTimeZone();
    final android = AndroidInitializationSettings('@drawable/ic_stat_local_florist');
    final ios = DarwinInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(
      settings,
        // onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
  }
  void onDidReceiveNotificationResponse(String? payload) async {
    print(payload);
  }

   void showScheduledNotification({
    int id=0,
    String? title,
    String? body,
    String? payload,
    required TimeOfDay scheduledDate,
})  async {
     _notifications.zonedSchedule(
       id,
       title,
       body,
       _scheduleDaily(Time(scheduledDate.hour,scheduledDate.minute)),
       await _notificationDetails(),
       payload: payload,
       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
       androidAllowWhileIdle: true,
       matchDateTimeComponents: DateTimeComponents.time,
     );
   }


   Future _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'Description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails()
    );
  }

  tz.TZDateTime _scheduleDaily(Time time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return scheduleDate.isBefore(now)  //check if the time is in the past
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }
  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }



  void cancelNotification() async{
    await _notifications.cancel(id);
  }
}