import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNoticeService {
  static final LocalNoticeService _localNoticeService =
      LocalNoticeService._internal();

  factory LocalNoticeService() {
    return _localNoticeService;
  }

  static const channelId = "custom_morning_evening_supplications_channel_id";
  static const channelName = "custom_morning_evening_supplications_channel";
  static const iosChannelIdentifier = "ios_channel_identifier";
  static const notificationId = 1234;

  LocalNoticeService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  Future<void> setupNotification() async {
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_launcher');

    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    showNotification(title: 'title', body: 'body');
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    setupNotification();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      threadIdentifier: iosChannelIdentifier,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
