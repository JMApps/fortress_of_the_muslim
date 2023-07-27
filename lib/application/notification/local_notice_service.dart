import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNoticeService {
  static final LocalNoticeService _localNoticeService =
      LocalNoticeService._internal();

  factory LocalNoticeService() {
    return _localNoticeService;
  }

  LocalNoticeService._internal();

  static const morningNotificationID = 395;
  static const eveningNotificationID = 376;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails androidMorningNotificationDetails =
  AndroidNotificationDetails(
    'Daily morning notification channel ID',
    'Notifications',
    channelDescription: 'Daily morning notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSMorningNotificationDetails =
  DarwinNotificationDetails();

  static const AndroidNotificationDetails androidEveningNotificationDetails =
  AndroidNotificationDetails(
    'Daily evening notification channel ID',
    'Notifications',
    channelDescription: 'Daily evening notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSEveningNotificationDetails =
  DarwinNotificationDetails();

  Future<void> setupNotification() async {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    }

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/ic_notif');

    const DarwinInitializationSettings iOSInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  Future<void> morningZonedScheduleNotification(DateTime date, String title, String body, int id) async {
    var tzDateNotification = tz.TZDateTime.from(date, tz.local);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzDateNotification,
      const NotificationDetails(
        android: androidMorningNotificationDetails,
        iOS: iOSMorningNotificationDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> eveningZonedScheduleNotification(DateTime date, String title, String body, int id) async {
    var tzDateNotification = tz.TZDateTime.from(date, tz.local);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzDateNotification,
      const NotificationDetails(
        android: androidEveningNotificationDetails,
        iOS: iOSEveningNotificationDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelNotificationWithId(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
