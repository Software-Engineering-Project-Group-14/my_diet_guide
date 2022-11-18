import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';

import '../screens/login.dart';
import '../screens/web_screens/web_login.dart';

class BMIController extends Controller {
  BMIController({Key? key, required super.context}) : super(key: key);

  @override
  State<BMIController> createState() => _BMIControllerState();
}

class _BMIControllerState extends State<BMIController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return CheckBMI();
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


