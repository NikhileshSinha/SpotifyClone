import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/Home/HomePage.dart';
import 'package:spotify_clone/Library/Library.dart';
import 'package:spotify_clone/Premium/Premium.dart';
import 'package:spotify_clone/Utils/notify.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Search/Search.dart';

void main() {

  //To initialise the flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  //To use the app in potrated mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'Spotify',
        channelName: 'Spotify Notification',
        channelDescription: 'notification for playing/pausing audio',
        importance: NotificationImportance.High,
      enableVibration: false,
      channelShowBadge: true,
    ),
  ]);

  runApp(
    //TODO: Authentication thing
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  Notify notify = Get.put(Notify());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/search': (context) => Search(),
      '/library': (context) => Library(),
      '/premium': (context) => Premium(),
    }
    );
  }
}