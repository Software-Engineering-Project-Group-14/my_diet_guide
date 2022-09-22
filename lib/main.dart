import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/record_progress_page.dart';
import 'package:my_diet_guide/screens/update_user_details.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_details.dart';

void main() {
  //runApp(const MyApp());
  // For testing
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: RecordProgressPage()),
    );
  }
}
