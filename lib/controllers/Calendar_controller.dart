import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/calendar_screen.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/web_screens/web_calendar_screen.dart';
import 'package:my_diet_guide/screens/web_screens/web_check_BMI.dart';

import '../screens/login.dart';
import '../screens/web_screens/web_login.dart';

class CalendarController extends Controller {
  CalendarController({Key? key, required super.context}) : super(key: key);

  @override
  State<CalendarController> createState() => _CalendarControllerState();
}

class _CalendarControllerState extends State<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth < 600){
              return DietCalender();
            } else {
              return WebDietCalender();
            }
          });
          //return CheckBMI();
        }else{
          return LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth < 600){
              return Login();
            } else {
              return WebLogin();
            }
          });
        }
      },
    );
  }

}


