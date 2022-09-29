import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/plan_generator/PlanGenerator.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBG6hB8dbhSyv4wnMM08rPCGVX-ttX8tNY",
        appId: "1:946107548040:android:dd03aea3530fcabeedba3d",
        messagingSenderId: "946107548040",
        projectId: "my-diet-guide-14",
      )
  );

  PlanGenerator planGenerator = PlanGenerator();
  print(planGenerator.getRandomActiveness());
  print(planGenerator.getRandomAgeGroup());
  print(planGenerator.getRandomIntensity());

  runApp(DevicePreview(builder: (context)=>MyApp()));



}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Diet Guide",
      home: Scaffold(

      )
    );
  }
}