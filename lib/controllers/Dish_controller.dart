import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/web_screens/add_new_dish.dart';
import 'package:my_diet_guide/screens/web_screens/web_check_BMI.dart';

import '../screens/login.dart';
import '../screens/web_screens/web_login.dart';

class DishController extends Controller {
  DishController({Key? key, required super.context}) : super(key: key);

  @override
  State<DishController> createState() => _DishControllerState();
}

class _DishControllerState extends State<DishController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return AddNewDish();
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


