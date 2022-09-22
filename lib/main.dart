import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/signup.dart';
import 'package:my_diet_guide/screens/view_diet.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';
import 'package:my_diet_guide/screens/view_uis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewUI(),
      routes: {
        '/diet_details': (context) => DietDetails(),
        '/view_diet_details' : (context) => ViewDietPlan(),
        '/check_bmi' : (context) => CheckBMI(),
        '/sign_up' : (context) => SignUp()
      },
    );
  }
}
