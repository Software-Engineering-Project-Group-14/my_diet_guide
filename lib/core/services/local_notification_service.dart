import 'package:rxdart/subjects.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService{
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async{
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/ic_stat_local_florist');
    DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    await _localNotificationService.initialize(
        settings,);
  }

  Future<NotificationDetails> _notificationDetails() async {
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'Description',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      playSound: true,
    );
    const DarwinNotificationDetails iOSNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    return const NotificationDetails(
        android: androidNotificationDetails,
        iOS: iOSNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final detials = await _notificationDetails();
    await _localNotificationService.show(id, title, body, detials,payload: 'payload');
  }
  Future<void> showScheduleNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final detials = await _notificationDetails();
    await _localNotificationService.show(id, title, body, detials,payload: 'payload');
  }

  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    print('Id $id');
  }
  void onSelectNotification(String? payload) {
    print('Payload $payload');
  }
}