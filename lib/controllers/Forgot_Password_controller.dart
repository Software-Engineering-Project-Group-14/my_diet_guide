import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/forgot_password.dart';
import '../screens/login.dart';
import '../screens/web_screens/web_forgot_password.dart';
import '../screens/web_screens/web_login.dart';

class ForgotPasswordController extends Controller {
  ForgotPasswordController({Key? key, required super.context}) : super(key: key);

  @override
  State<ForgotPasswordController> createState() => _ForgotPasswordControllerState();
}

class _ForgotPasswordControllerState extends State<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return LayoutBuilder(
              builder: (context, constraints){
                if(constraints.maxWidth < 600){
                  return ForgotPassword();
                }else{
                  return WebForgotPassword();
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