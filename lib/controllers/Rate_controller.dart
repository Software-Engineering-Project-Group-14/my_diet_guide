import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/login.dart';
import '../screens/rate.dart';
import '../screens/web_screens/web_login.dart';
import '../screens/web_screens/web_rate_screen.dart';


class RateController extends Controller {
  RateController({Key? key, required super.context}) : super(key: key);

  @override
  State<RateController> createState() => _RateControllerState();
}

class _RateControllerState extends State<RateController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return LayoutBuilder(
              builder: (context, constraints){
                if(constraints.maxWidth < 600){
                  return Rate();
                }else{
                  return WebRate();
                }
              }
          );
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


